# Technical Report: Trading Application Watchlist Implementation

## Overview
This project is a professional-grade Watchlist implementation developed as part of the Flutter Developer assessment for **021 Trade**. The core objective was to implement a dynamic stock reordering system leveraging the **BLoC (Business Logic Component)** architecture while maintaining a premium UI/UX, full responsiveness, and high code quality.

---

## Architectural Approach
The application follows **Clean Architecture** principles to ensure the codebase remains maintainable, testable, and scalable.

### 1. Data Layer
* **Models:** Implements `StockModel` with type-safe JSON serialization.
* **Data Sources:** Currently manages a local repository of sample data, architected to be seamlessly replaced by REST or WebSocket providers.

### 2. Domain Layer
* **Logic:** Business rules are encapsulated independently of the UI framework.
* **Entities:** Core trading objects are defined as pure Dart classes to maintain logic integrity.

### 3. Presentation Layer
* **State Management:** Utilizes the **BLoC pattern** for predictable, unidirectional data flow.
* **Atomic Design:** Built using small, reusable widgets (e.g., `StockTile`) to minimize code duplication.

---

## BLoC Implementation: Reordering Logic
The primary requirement of swapping stock positions is managed within the `WatchlistBloc`. To ensure state predictability and UI fluidity, the following logic was applied:

* **Immutability:** Each reorder event generates a new list instance, adhering to the principle of state immutability to prevent unintended UI side effects.
* **Index Normalization:** The implementation explicitly handles the index shift inherent in Flutter's `ReorderableListView` (adjusting the `newIndex` by -1 when moving items downward).
* **Type Safety:** Uses sealed classes for Events and States, ensuring exhaustive pattern matching and eliminating runtime state errors.

```dart
final updatedList = List<StockModel>.from(currentStocks);

int targetIndex = event.newIndex;
if (targetIndex > event.oldIndex) targetIndex -= 1;

final item = updatedList.removeAt(event.oldIndex);
updatedList.insert(targetIndex, item);

emit(WatchlistState.loaded(
  stocks: List.unmodifiable(updatedList),
  selectedIndex: state.selectedIndex,
));
```

---

## Key Features & Quality Pillars

### Navigation (GoRouter)
* **Declarative Routing:** Navigation is treated as a function of the app state.
* **Scalability:** Implementation is ready for deep linking and complex nested navigation.

###  UI/UX Excellence
* **Premium Aesthetic:** Consistent dark theme with high-fidelity "Glassmorphism" elements.
* **Interactive Feedback:** Smooth drag-and-drop transitions, swipe-to-delete gestures, and SnackBar confirmations for all user actions.

###  Responsiveness
* **Adaptive Scaling:** Utilizes a custom `rs` (Responsive Size) utility to scale spacing, typography, and container dimensions dynamically across various mobile screen ratios.

###  Code Quality & Type Safety
* **Strong Typing:** Leverages `freezed` and `json_serializable` for immutable data models and states.
* **Maintainability:** Clear separation of layers with a focus on atomic widget reusability and minimal logic duplication.

---

## Project Structure
```text
lib/
├── core/
│   └── theme/           # Design tokens and color schemes
├── features/
│   └── trading/
│       ├── data/        # Models and data mapping
│       ├── domain/      # Core entities
│       └── presentation/# BLoC, Pages, and Feature widgets
├── shared/
│   ├── helper/          # Responsive scaling utilities
│   ├── routes/          # GoRouter configuration
│   └── widget/          # Reusable UI components
├── app.dart             # Root widget and theme setup
└── main.dart            # Entry point
```

## Technical Stack
* **Framework:** Flutter (Latest Stable)
* **State Management:** `flutter_bloc`
* **Routing:** `go_router`
* **Modeling:** `freezed`, `json_serializable`
* **Responsiveness:** Custom Scaling Helper