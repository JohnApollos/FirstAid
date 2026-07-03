import 'package:flutter/widgets.dart';

/// Responsive layout utilities to check current device viewport properties.
class Responsive {
  /// Checks if the device screen width qualifies as a tablet (>600dp).
  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width > 600;
  }

  /// Checks if the screen width represents a large tablet/desktop viewport (>900dp).
  static bool isLargeTablet(BuildContext context) {
    return MediaQuery.of(context).size.width > 900;
  }

  /// Checks if the device has a physical folding crease or hinge.
  static bool hasHinge(BuildContext context) {
    final displayFeatures = MediaQuery.of(context).displayFeatures;
    return displayFeatures.isNotEmpty;
  }

  /// Retrieves the physical fold bounds (if a hinge/crease is present) to offset elements.
  static Rect? getHingeBounds(BuildContext context) {
    final displayFeatures = MediaQuery.of(context).displayFeatures;
    if (displayFeatures.isEmpty) return null;
    return displayFeatures.first.bounds;
  }
}
