# Contributing to FirstAid+ v2 🚑

Thank you for contributing to FirstAid+! Below are the guidelines for writing code, adding medical protocols, and verifying builds in our Flutter environment.

---

## 🩺 Adding Medical Protocols & Localization

FirstAid+ is offline-first. To add new medical guidelines:

1. **Verify Source**: All guidelines must be sourced from official medical boards (e.g., Red Cross, St John Ambulance).
2. **Update Database Seeding**:
   - Open `lib/core/database/isar_service.dart`.
   - Update the seed procedure list inside the DB initialization code.
   - Provide localized text strings for English (`en`), Swahili (`sw`), and Somali (`so`) translations inside the `LocalizedText` constructor blocks.
3. **Illustrations**:
   - Add high-contrast illustration files to `assets/images/` (in PNG or JPG format).
   - Ensure the file name is mapped in the step's `imageResource` field.

---

## 💻 Coding Guidelines

### Flutter & Dart Conventions
- Adhere to the official [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style).
- Use **Riverpod** for state management and UI bindings.
- Decouple business logic services (`lib/core/services/`) from UI screens.
- Keep widgets cohesive, responsive, and adaptive (mobile vs. tablet views).

### Code Generation (build_runner)
When modifying Isar models (under `lib/core/database/models/`), you must re-generate the database adapters:
```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## 🧪 Verification & Build Checks

Before submitting a Pull Request:

1. **Static Analysis**: Verify that there are zero compilation errors or lint warnings:
   ```bash
   flutter analyze
   ```
2. **Localizations Rebuild**: If you modified localization files, verify they compile cleanly:
   ```bash
   flutter gen-l10n
   ```
3. **Compilation Check**: Confirm the app compiles successfully:
   ```bash
   flutter build apk --debug
   ```

---
*Created by Apollos Digital Solutions Venture Team.*
