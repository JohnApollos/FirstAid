# Changelog

All notable changes to the **FirstAid+** project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [2.0.0] - 2026-07-03

### Added
- **Flutter Framework Migration**: Full rebuild of the application to run cross-platform (iOS and Android) and scale to tablets, foldables, and desktop form factors.
- **Isar NoSQL Database**: Zero-latency offline-first database storing emergency procedures, steps, quiz questions, and telemetry logs.
- **Supabase Core Integration**: Background sync worker that streams local user interaction logs to Supabase PostgreSQL once Wi-Fi and charging conditions are met.
- **Dual-Pane UI System**: Master-Detail view that splits the screen (2/3 detail view, 1/3 list) on devices wider than 600dp (tablets, unfolded foldables).
- **Hinge Crease Detection**: Support for foldables (using the `display_features` package) which shifts interactive touch targets away from physical screen hinges.
- **CPR Resuscitation Metronome**: High-precision periodic metronome that flashes the screen and plays click sounds at exactly 110 bpm.
- **Swahili (Kiswahili) Localization**: Language switcher toggle mapping to `.arb` localization bundles, dynamically reloading the interface and the platform Text-to-Speech (TTS) voice locale (`sw-KE`).
- **Smart GPS Sos Service**: Displays real-time GPS coordinates (Latitude, Longitude, Altitude) offline, with one-tap pre-filled coordinates SMS dispatch to `1199`.

### Changed
- Moved original native Android Java code to `legacy-android/` for backup.
- Replaced local SQLite schema with optimized Isar collection schemas.
- Upgraded TTS logic to a cross-platform API supporting local Swahili voices.

---

## [1.0.0] - 2026-01-27

### Added
- Native Android prototype built with Java.
- Local SQLite database supporting 10 standard emergency protocols.
- Basic English Text-To-Speech guidance.
- Simple emergency button dialing `1199`.
- Hardcoded quiz module with 17 multiple choice and true/false questions.
