import 'package:geolocator/geolocator.dart';

/// Service class to handle GPS location requests.
/// Queries the device's internal GPS receiver and handles permissions.
class LocationService {
  /// Checks and requests location permissions.
  /// Returns true if permission is granted.
  Future<bool> checkPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return true;
  }

  /// Fetches the current location coordinates.
  /// Uses a high accuracy setting with a fallback to cache.
  Future<Position?> getCurrentLocation() async {
    final hasPermission = await checkPermission();
    if (!hasPermission) {
      return null;
    }

    try {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 5),
      );
    } catch (e) {
      // Return last known position as fallback if GPS signal is weak
      return await Geolocator.getLastKnownPosition();
    }
  }

  /// Streams location changes in real-time.
  Stream<Position> getLocationStream() {
    return Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10, // Update location every 10 meters
      ),
    );
  }
}
