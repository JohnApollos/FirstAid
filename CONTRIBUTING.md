# Contributing to FirstAid+ 🚑

First, thank you for considering contributing to FirstAid+! Every contribution helps make this life-saving tool better for everyone.

## 🩺 Adding New Medical Protocols

If you want to add a new first-aid procedure, please follow these steps:

1.  **Verify Information**: Ensure the medical instructions are based on current, verified medical standards (e.g., Red Cross, St John Ambulance).
2.  **Update Database**:
    *   Add a new entry to the `procedures` table.
    *   Add the sequential steps to the `steps` table.
3.  **Add Assets**: If the protocol requires a diagram, add a low-res, high-contrast PNG to `app/src/main/res/drawable`.

## 💻 Code Contributions

### Branching Strategy
- `main`: Production-ready code.
- `develop`: Ongoing development.
- `feature/*`: New features or medical protocols.

### Code Style
- Use standard Java naming conventions (CamelCase for classes, camelCase for methods/variables).
- Ensure all new Activities are registered in `AndroidManifest.xml`.
- Add Javadoc comments to all new public methods.

## 🧪 Testing

Before submitting a Pull Request, please ensure:
1.  The app builds successfully via `./gradlew assembleDebug`.
2.  The SQLite database migrations (if any) are handled correctly.
3.  The Text-To-Speech engine correctly reads out the new instructions.

## 📄 Reporting Bugs

If you find a bug, please open an issue with:
- A clear, descriptive title.
- Steps to reproduce the issue.
- Your device model and Android version.

---
*Thank you for helping us protect the Golden Hour!*
