# FirstAid+ Architecture & Design

This document details the architectural decisions, database schemas, and service integrations powering **FirstAid+ v2**.

---

## 🏗️ Architecture Overview

FirstAid+ follows clean architecture principles to separate business logic from the UI rendering layer, ensuring zero runtime latency and testability.

```text
lib/
├── core/
│   ├── database/          # Isar NoSQL collections & database helper
│   ├── network/           # Supabase client & sync adapter
│   ├── providers/         # Riverpod global state providers
│   ├── services/          # Geolocator, Metronome, and TTS services
│   ├── theme/             # Medical Red UI theme styles
│   └── utils/             # Viewport & foldable responsive utilities
└── features/
    ├── about/             # Marsabit pilot profiles & venture info
    ├── emergency/         # GPS SOS coordinates & dialer intents
    ├── home/              # Guide search grid & step details
    └── training/          # CPR Metronome flashing UI & quiz flow
```

---

## 🗄️ Database Schemas (Isar NoSQL)

FirstAid+ uses **Isar NoSQL** as its local storage engine. Isar runs compiled C bindings for rapid, zero-lag query execution on ARM processors.

### Collections

#### 1. `Procedure`
Stores high-level emergency medical categories with full-text search indexing on titles.
- `id`: Unique integer primary key (`Id`).
- `titleEn` / `titleSw`: Category names.
- `iconName`: Asset identifier.
- `severityLevel`: Triage classification (`1` for Critical, `2` for Standard).
- `steps`: Embedded list of `FirstAidStep` objects.

#### 2. `FirstAidStep` (Embedded)
Contains the sequential steps for each emergency protocol.
- `stepOrder`: Sequence order index.
- `instructionEn` / `instructionSw`: L10n step guidance text.
- `imageResource`: Illustration drawable asset key.

#### 3. `QuizQuestion`
Powers the preparedness assessment module.
- `id`: Unique primary key.
- `questionEn` / `questionSw`: Question prompts.
- `optionsEn` / `optionsSw`: Array of multiple-choice options.
- `correctOptionIndex`: Index (`0` to `3`) of the correct answer.
- `explanationEn` / `explanationSw`: Answer key rationales.

#### 4. `TelemetryLog`
Caches user action logs offline.
- `id`: Unique primary key.
- `eventName`: Activity descriptor (e.g., `view_procedure`).
- `metadataJson`: Key-value pair strings describing the event details.
- `timestamp`: Creation date.
- `synced`: Sync flag (`true`/`false`).

---

## 🚨 Offline SOS & Intent Integrations

- **GPS Service**: Queries the device's internal GPS receiver offline to extract `Latitude`, `Longitude`, and `Accuracy` in meters.
- **Dialer Intents**: Employs standard telephonic schemes to open the system dialer with Red Cross dispatch (`1199`) prefilled.
- **SMS Coordinates Dispatcher**: Generates pre-populated emergency templates containing the live coordinates, sending them instantly to `1199`.

---

## ⏱️ Precise Resuscitation Metronome

- **Timing Pacing**: Configured to run at **110 beats per minute** (545ms interval).
- **Sensory Feedback**: Flashes a high-contrast card (Cyan-to-Charcoal) and triggers system haptics/audio ticks on every interval to help pacing under stress.

---

## 🎨 UI/UX Philosophy: "Panic-Proof" Design

1. **Severity Triage**: Life-threatening emergencies (Severity 1) render with red borders and light-red backgrounds to stand out in panic situations.
2. **Clear Font Scale**: Standardizes on modern, high-contrast sans-serif typography (Material 3).
3. **No Placeholders**: Leverages native asset illustration guidelines instead of generic icon placeholders.
4. **Adaptive Viewports**: Switches automatically to dual-pane Master-Detail navigation on screen widths >600dp.
