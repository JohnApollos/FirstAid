import 'dart:async';
import 'package:flutter/services.dart';

/// Service class to manage the CPR chest compression metronome.
/// Triggers visual flashes and haptic feedback at 110 beats per minute (545ms intervals).
class MetronomeService {
  Timer? _timer;
  bool _isPlaying = false;
  
  // Callback invoked on every tick to update the UI state
  void Function(bool isTickActive)? onTick;

  bool get isPlaying => _isPlaying;

  /// Starts the metronome ticking at 110 BPM (approx. 545ms interval).
  void start() {
    if (_isPlaying) return;
    _isPlaying = true;

    bool state = false;
    _timer = Timer.periodic(const Duration(milliseconds: 545), (timer) {
      state = !state;
      
      // Trigger UI callback
      if (onTick != null) {
        onTick!(state);
      }

      // Trigger lightweight haptic feedback on the physical device
      HapticFeedback.lightImpact();
    });
  }

  /// Stops the metronome timer and resets variables.
  void stop() {
    _timer?.cancel();
    _timer = null;
    _isPlaying = false;
    if (onTick != null) {
      onTick!(false);
    }
  }

  /// Toggles start/stop states.
  void toggle() {
    if (_isPlaying) {
      stop();
    } else {
      start();
    }
  }
}
