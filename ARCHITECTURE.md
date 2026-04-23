# FirstAid+ Architecture & Design

This document provides a technical deep-dive into the architectural decisions and data structures powering FirstAid+.

## 🗄️ Database Schema (SQLite)

The core of the app's offline capability is its local database. The schema is designed for rapid retrieval of multi-step procedures.

### Tables

#### 1. `procedures`
Stores the high-level medical categories.
- `id` (INTEGER, PK): Unique identifier.
- `title` (TEXT): Name of the condition (e.g., "Cardiac Arrest").
- `icon_name` (TEXT): Reference to the drawable resource name.
- `category` (TEXT): Grouping for search optimization.

#### 2. `steps`
Contains the granular instructions for each procedure.
- `id` (INTEGER, PK): Unique identifier.
- `procedure_id` (INTEGER, FK): Links to `procedures.id`.
- `step_order` (INTEGER): Sequence number for the step.
- `instruction` (TEXT): The actual first-aid instruction.
- `image_resource` (TEXT): Optional image for visual aid.

#### 3. `quiz_questions`
Powering the Educational Module.
- `id` (INTEGER, PK): Unique identifier.
- `question` (TEXT): The question text.
- `option_a`, `option_b`, `option_c`, `option_d`: Multiple choice options.
- `correct_answer` (TEXT): Stores the correct choice (A, B, C, or D).

## 🔊 Voice Guidance (TTS Implementation)

To assist users who cannot look at the screen (e.g., during CPR), FirstAid+ implements the `android.speech.tts.TextToSpeech` API.

**Key Logic:**
- **Initialization**: TTS is initialized in `DetailActivity` with a fallback for missing language data.
- **Queueing**: Steps are spoken in sequence using `QUEUE_ADD`.
- **Interruption**: Users can stop the voice guidance at any time using the high-visibility Floating Action Button (FAB).

## 🚨 Emergency Dialer Logic

The emergency dialer bypasses unnecessary UI layers to trigger the system dialer instantly.

```java
Intent intent = new Intent(Intent.ACTION_DIAL);
intent.setData(Uri.parse("tel:1199")); // National Emergency Service
startActivity(intent);
```
*Note: Using `ACTION_DIAL` instead of `ACTION_CALL` to ensure the user has one final confirmation step, preventing accidental pocket-dials while still being extremely fast.*

## 🎨 UI/UX Philosophy: "Panic-Proof" Design

1.  **High Contrast**: Uses a strict palette of `#D32F2F` (Medical Red) and `#FFFFFF` (White) to ensure readability in direct sunlight or dim environments.
2.  **Large Touch Targets**: All interactive elements (buttons, list items) have a minimum height of 56dp to accommodate shaking hands or limited dexterity during a crisis.
3.  **Minimal Hierarchy**: No feature is more than two taps away from the Home Screen.
