import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firstaid/l10n/app_localizations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/providers/providers.dart';

class EmergencyScreen extends ConsumerStatefulWidget {
  const EmergencyScreen({super.key});

  @override
  ConsumerState<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends ConsumerState<EmergencyScreen> {
  Position? _currentPosition;
  bool _permissionGranted = false;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchLocation();
  }

  Future<void> _fetchLocation() async {
    final locationService = ref.read(locationServiceProvider);
    final hasPermission = await locationService.checkPermission();
    
    setState(() {
      _permissionGranted = hasPermission;
    });

    if (hasPermission) {
      // 1. Fetch initial position immediately so it loads instantly
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

      // 2. Stream subsequent updates
      locationService.getLocationStream().listen((pos) {
        if (mounted) {
          setState(() {
            _currentPosition = pos;
            _loading = false;
          });
        }
      });
    } else {
      setState(() {
        _loading = false;
      });
    }
  }

  Future<void> _makeCall() async {
    final url = Uri.parse('tel:1199');
    // Log emergency dial event
    ref.read(isarServiceProvider).logEvent("emergency_dial", {"number": "1199"});

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not trigger system dialer.')),
      );
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

    // SMS URL scheme format: sms:number?body=encoded_message
    final uri = Uri.parse('sms:1199?body=${Uri.encodeComponent(message)}');

    // Log SMS intent event
    ref.read(isarServiceProvider).logEvent("emergency_sms", {"number": "1199"});

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // Fallback: Copy to clipboard if launcher fails
      await Clipboard.setData(ClipboardData(text: message));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Coordinates copied to clipboard. Paste into SMS app.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.emergencyCall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Big High-Visibility Call Card
            Card(
              color: Colors.red[50],
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(color: Colors.red, width: 2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const Icon(
                      Icons.emergency,
                      size: 80,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
                      ),
                      onPressed: _makeCall,
                      child: Text(
                        l10n.emergencyCall,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Live Location Display Card
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.gps_fixed, color: Colors.blueAccent),
                        const SizedBox(width: 8),
                        Text(
                          l10n.liveGps,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 24),
                    if (_loading)
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
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
                          const SizedBox(height: 12),
                          _buildCoordRow(l10n.longitude, _currentPosition!.longitude.toString()),
                          const SizedBox(height: 12),
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
            const SizedBox(height: 24),

            // Secondary Location Actions
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.red, width: 1.5),
                      foregroundColor: Colors.red[700],
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
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
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2E2E2E),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
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
          ],
        ),
      ),
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
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
