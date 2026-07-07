import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firstaid/l10n/app_localizations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/providers/providers.dart';
import '../../core/database/models/regional_directory.dart';
import 'medical_id_screen.dart';

class EmergencyScreen extends ConsumerStatefulWidget {
  const EmergencyScreen({super.key});

  @override
  ConsumerState<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends ConsumerState<EmergencyScreen> {
  Position? _currentPosition;
  bool _permissionGranted = false;
  bool _loading = true;

  // Medical ID Fields
  String _medName = '';
  String _medBloodGroup = 'Unknown';
  String _medAllergies = '';
  String _medIceName = '';
  String _medIcePhone = '';
  String _selectedRegion = 'Northern Region';
  String _regionalHotline = '+254 722 000 001';

  // Referral Directory Fields
  List<ReferralHospital> _allHospitals = [];
  List<ReferralHospital> _filteredHospitals = [];
  List<RegionalOffice> _allOffices = [];
  List<RegionalOffice> _filteredOffices = [];
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchLocation();
    _loadMedicalId();
    _loadDirectory();
  }

  Future<void> _loadMedicalId() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _medName = prefs.getString('med_name') ?? '';
      _medBloodGroup = prefs.getString('med_blood_group') ?? 'Unknown';
      _medAllergies = prefs.getString('med_allergies') ?? '';
      _medIceName = prefs.getString('med_ice_name') ?? '';
      _medIcePhone = prefs.getString('med_ice_phone') ?? '';
      _selectedRegion = prefs.getString('med_region') ?? 'Northern Region';

      // Route SOS calls locally based on selected region
      if (_selectedRegion == 'Northern Region') {
        _regionalHotline = '+254 722 000 001'; // KRCS Northern Regional Office
      } else if (_selectedRegion == 'Nairobi Region') {
        _regionalHotline = '1199';
      } else {
        _regionalHotline = '1199'; // Default national hotline fallback
      }
    });
  }

  Future<void> _loadDirectory() async {
    final isarService = ref.read(isarServiceProvider);
    final hospitals = await isarService.getAllReferralHospitals();
    final offices = await isarService.getAllRegionalOffices();
    setState(() {
      _allHospitals = hospitals;
      _filteredHospitals = hospitals;
      _allOffices = offices;
      _filteredOffices = offices;
    });
  }

  void _filterDirectory(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredHospitals = _allHospitals;
        _filteredOffices = _allOffices;
      } else {
        final q = query.toLowerCase();
        _filteredHospitals = _allHospitals.where((h) {
          return (h.hospitalName?.toLowerCase().contains(q) ?? false) ||
              (h.regionName?.toLowerCase().contains(q) ?? false) ||
              (h.countyName?.toLowerCase().contains(q) ?? false) ||
              (h.capabilityTier?.toLowerCase().contains(q) ?? false);
        }).toList();
        _filteredOffices = _allOffices.where((o) {
          return (o.locationName?.toLowerCase().contains(q) ?? false) ||
              (o.regionName?.toLowerCase().contains(q) ?? false) ||
              (o.countyName?.toLowerCase().contains(q) ?? false);
        }).toList();
      }
    });
  }

  Future<void> _fetchLocation() async {
    final locationService = ref.read(locationServiceProvider);
    final hasPermission = await locationService.checkPermission();
    
    if (mounted) {
      setState(() {
        _permissionGranted = hasPermission;
      });
    }

    if (hasPermission) {
      try {
        final pos = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
          timeLimit: const Duration(seconds: 5),
        );
        if (mounted) {
          setState(() {
            _currentPosition = pos;
            _loading = false;
          });
        }
      } catch (e) {
        try {
          final lastPos = await Geolocator.getLastKnownPosition();
          if (lastPos != null && mounted) {
            setState(() {
              _currentPosition = lastPos;
              _loading = false;
            });
          }
        } catch (_) {}
      }

      locationService.getLocationStream().listen((pos) {
        if (mounted) {
          setState(() {
            _currentPosition = pos;
            _loading = false;
          });
        }
      });
    } else {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  Future<void> _makeCall(String number) async {
    final url = Uri.parse('tel:$number');
    ref.read(isarServiceProvider).logEvent("emergency_dial", {"number": number});

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not trigger system dialer.')),
        );
      }
    }
  }

  Future<void> _sendSms() async {
    if (_currentPosition == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Waiting for GPS coordinates...')),
      );
      return;
    }

    final message = "Emergency! First Aid needed. Location coordinates: "
        "Latitude ${_currentPosition!.latitude}, "
        "Longitude ${_currentPosition!.longitude}. "
        "Accuracy: ${_currentPosition!.accuracy.toStringAsFixed(1)}m.";

    final uri = Uri.parse('sms:1199?body=${Uri.encodeComponent(message)}');
    ref.read(isarServiceProvider).logEvent("emergency_sms", {"number": "1199"});

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      await Clipboard.setData(ClipboardData(text: message));
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Coordinates copied. Paste into SMS app.')),
        );
      }
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.emergencyCall),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. Medical ID / ICE Card
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.red.shade200, width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.assignment_ind, color: Colors.red),
                            SizedBox(width: 8),
                            Text(
                              "PARAMEDIC MEDICAL ID (ICE)",
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.grey),
                          onPressed: () async {
                            final updated = await Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => const MedicalIdScreen()),
                            );
                            if (updated == true) {
                              _loadMedicalId();
                            }
                          },
                        ),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(height: 4),
                    _buildMedRow("Name / Jina:", _medName.isNotEmpty ? _medName : "Not Configured"),
                    const SizedBox(height: 8),
                    _buildMedRow("Blood Group:", _medBloodGroup),
                    const SizedBox(height: 8),
                    _buildMedRow("Allergies / Mzio:", _medAllergies.isNotEmpty ? _medAllergies : "None reported"),
                    const SizedBox(height: 8),
                    _buildMedRow("ICE Contact:", _medIceName.isNotEmpty ? "$_medIceName ($_medIcePhone)" : "Not Configured"),
                    const SizedBox(height: 8),
                    _buildMedRow("Home KRCS Region:", _selectedRegion),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 2. High-Visibility Two-Tier Call Card
            Card(
              color: Colors.red[50],
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(color: Colors.red, width: 2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Icon(Icons.contact_support, size: 60, color: Colors.red),
                    const SizedBox(height: 12),
                    const Text(
                      "TWO-TIER EMERGENCY SOS ROUTING",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black54),
                    ),
                    const SizedBox(height: 16),

                    // Tier 1: Regional Dispatch Hotline
                    if (_selectedRegion != 'Nairobi Region' && _selectedRegion.isNotEmpty) ...[
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[900],
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () => _makeCall(_regionalHotline),
                        icon: const Icon(Icons.location_on),
                        label: Text(
                          "Call $_selectedRegion Dispatch",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],

                    // Tier 2: National Fallback Hotline (1199)
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () => _makeCall('1199'),
                      icon: const Icon(Icons.phone_in_talk),
                      label: const Text(
                        "Call National EPlus Hotline (1199)",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 3. Live Location Display Card
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.gps_fixed, color: Colors.blueAccent),
                        const SizedBox(width: 8),
                        Text(
                          l10n.liveGps,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Divider(height: 20),
                    if (_loading)
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: CircularProgressIndicator(),
                        ),
                      )
                    else if (!_permissionGranted)
                      Center(
                        child: Column(
                          children: [
                            const Text(
                              "GPS Permissions Denied",
                              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: _fetchLocation,
                              child: const Text("Grant Permissions"),
                            ),
                          ],
                        ),
                      )
                    else if (_currentPosition == null)
                      const Center(
                        child: Text("Resolving satellite signals..."),
                      )
                    else
                      Column(
                        children: [
                          _buildCoordRow(l10n.latitude, _currentPosition!.latitude.toString()),
                          const SizedBox(height: 8),
                          _buildCoordRow(l10n.longitude, _currentPosition!.longitude.toString()),
                          const SizedBox(height: 8),
                          _buildCoordRow(
                            l10n.accuracy,
                            "±${_currentPosition!.accuracy.toStringAsFixed(1)} meters",
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 4. Secondary Location Actions Row
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.red, width: 1.5),
                      foregroundColor: Colors.red[700],
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      if (_currentPosition != null) {
                        final text = "${_currentPosition!.latitude}, ${_currentPosition!.longitude}";
                        Clipboard.setData(ClipboardData(text: text));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(l10n.copyLocation)),
                        );
                      }
                    },
                    icon: const Icon(Icons.copy, size: 20),
                    label: Text(
                      l10n.copyLocation,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2E2E2E),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      elevation: 2,
                    ),
                    onPressed: _sendSms,
                    icon: const Icon(Icons.sms, size: 20),
                    label: Text(
                      l10n.shareLocation,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // 5. Searchable Offline Regional Referral Directory
            const Text(
              "OFFLINE KRCS REGIONAL REFERRAL DIRECTORY",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 13),
            ),
            const Divider(),
            const SizedBox(height: 8),

            // Directory Search Bar
            TextField(
              controller: _searchController,
              onChanged: _filterDirectory,
              decoration: InputDecoration(
                hintText: "Search by Region, Hospital or County...",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _filterDirectory('');
                        },
                      )
                    : null,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Search Results Lists
            if (_filteredOffices.isNotEmpty) ...[
              const Text(
                "Red Cross Regional & Field Offices",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 14),
              ),
              const SizedBox(height: 4),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _filteredOffices.length,
                itemBuilder: (context, idx) {
                  final office = _filteredOffices[idx];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      title: Text(office.locationName ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text("Region: ${office.regionName} | County: ${office.countyName}"),
                      trailing: IconButton(
                        icon: const Icon(Icons.phone, color: Colors.green),
                        onPressed: () => _makeCall(office.contactPhone ?? ''),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
            ],

            if (_filteredHospitals.isNotEmpty) ...[
              const Text(
                "Regional Referral Hospitals",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 14),
              ),
              const SizedBox(height: 4),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _filteredHospitals.length,
                itemBuilder: (context, idx) {
                  final hosp = _filteredHospitals[idx];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      title: Text(hosp.hospitalName ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text("${hosp.capabilityTier} | County: ${hosp.countyName}"),
                      trailing: IconButton(
                        icon: const Icon(Icons.phone, color: Colors.green),
                        onPressed: () => _makeCall(hosp.contactPhone ?? ''),
                      ),
                    ),
                  );
                },
              ),
            ],

            if (_filteredHospitals.isEmpty && _filteredOffices.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24.0),
                child: Center(
                  child: Text(
                    "No matching helplines found offline.",
                    style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 14),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildCoordRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
        ),
        Text(
          value,
          style: const TextStyle(
            fontFamily: 'monospace',
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
