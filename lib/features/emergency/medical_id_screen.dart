import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MedicalIdScreen extends StatefulWidget {
  const MedicalIdScreen({super.key});

  @override
  State<MedicalIdScreen> createState() => _MedicalIdScreenState();
}

class _MedicalIdScreenState extends State<MedicalIdScreen> {
  final _formKey = GlobalKey<FormState>();
  
  final _nameController = TextEditingController();
  final _allergiesController = TextEditingController();
  final _iceNameController = TextEditingController();
  final _icePhoneController = TextEditingController();

  String _bloodGroup = 'Unknown';
  String _selectedRegion = 'Northern Region';

  final List<String> _bloodGroups = ['Unknown', 'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
  
  final List<String> _krcsRegions = [
    'Northern Region',
    'Nairobi Region',
    'Central Region',
    'Coast Region',
    'Rift Valley Region',
    'Western Region',
    'Nyanza Region',
    'Eastern Region'
  ];

  @override
  void initState() {
    super.initState();
    _loadMedicalId();
  }

  Future<void> _loadMedicalId() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nameController.text = prefs.getString('med_name') ?? '';
      _allergiesController.text = prefs.getString('med_allergies') ?? '';
      _iceNameController.text = prefs.getString('med_ice_name') ?? '';
      _icePhoneController.text = prefs.getString('med_ice_phone') ?? '';
      _bloodGroup = prefs.getString('med_blood_group') ?? 'Unknown';
      _selectedRegion = prefs.getString('med_region') ?? 'Northern Region';
    });
  }

  Future<void> _saveMedicalId() async {
    if (_formKey.currentState!.validate()) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('med_name', _nameController.text.trim());
      await prefs.setString('med_allergies', _allergiesController.text.trim());
      await prefs.setString('med_ice_name', _iceNameController.text.trim());
      await prefs.setString('med_ice_phone', _icePhoneController.text.trim());
      await prefs.setString('med_blood_group', _bloodGroup);
      await prefs.setString('med_region', _selectedRegion);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Medical ID saved successfully.')),
        );
        Navigator.of(context).pop(true); // Return true to trigger reload
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _allergiesController.dispose();
    _iceNameController.dispose();
    _icePhoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Medical ID & Region"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.contact_emergency, size: 70, color: Colors.red),
              const SizedBox(height: 16),
              const Text(
                "First responders can view this data instantly on the emergency dashboard to assist you.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 24),

              // Full Name
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Full Name",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 16),

              // Blood Group & Region Row
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _bloodGroup,
                      decoration: const InputDecoration(
                        labelText: "Blood Group",
                        border: OutlineInputBorder(),
                      ),
                      items: _bloodGroups.map((group) {
                        return DropdownMenuItem(value: group, child: Text(group));
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          _bloodGroup = val ?? 'Unknown';
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // KRCS Region Selection
              DropdownButtonFormField<String>(
                value: _selectedRegion,
                decoration: const InputDecoration(
                  labelText: "Kenya Red Cross Region",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.map),
                ),
                items: _krcsRegions.map((region) {
                  return DropdownMenuItem(value: region, child: Text(region));
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    _selectedRegion = val ?? 'Northern Region';
                  });
                },
              ),
              const SizedBox(height: 16),

              // Allergies / Chronic Conditions
              TextFormField(
                controller: _allergiesController,
                decoration: const InputDecoration(
                  labelText: "Allergies / Medical Conditions",
                  hintText: "e.g., Asthma, Penicillin allergy",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.warning_amber),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 24),

              const Text(
                "ICE (In Case of Emergency) Contact",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.red),
              ),
              const Divider(height: 16),

              // ICE Contact Name
              TextFormField(
                controller: _iceNameController,
                decoration: const InputDecoration(
                  labelText: "Contact Person Name",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.assignment_ind),
                ),
              ),
              const SizedBox(height: 16),

              // ICE Contact Phone
              TextFormField(
                controller: _icePhoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "Contact Phone Number",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
                validator: (val) {
                  if (val != null && val.isNotEmpty && !RegExp(r'^\+?[0-9]{9,15}$').hasMatch(val)) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),

              // Save Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: _saveMedicalId,
                child: const Text(
                  "SAVE MEDICAL ID",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
