# Trading Demo App | High-End FinTech Experience

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Clean Architecture](https://img.shields.io/badge/Architecture-Clean_Arch-green?style=for-the-badge)

A premium, production-grade Trading application built with Flutter, demonstrating advanced architectural patterns, high-performance UI rendering, and scalable state management. This project serves as a showcase for modern mobile development practices in the financial technology sector.

---

## 🚀 Project Overview

The **Trading Demo App** is designed for the modern trader, combining ultra-fast performance with a high-fidelity "Glassmorphism" aesthetic. The application prioritizes split-second responsiveness and data integrity, essential for high-stakes trading environments.

- **Fluid UX:** Optimized for 60/120 FPS interactions.
- **Glassmorphism Design:** A sleek, dark-themed interface utilizing backdrop filters and subtle gradients for a premium feel.
- **Enterprise-Ready:** Built on Clean Architecture principles to ensure long-term maintainability and testability.

---

## 🏗️ Architecture Breakdown

The project follows the **Clean Architecture** pattern, enforcing a strict separation of concerns to decouple business logic from the UI and external data sources.

### 1. Data Layer
- **Models:** Implements `StockModel` with JSON serialization.
- **Data Sources:** Currently utilizes local dummy data/helpers for rapid prototyping, easily swappable for REST/WebSocket implementations.

### 2. Domain Layer
- **Logic:** Business rules are encapsulated within the BLoC layer, ensuring that the UI remains a "dumb" reflection of the state.
- **Entities:** Pure Dart classes representing the core trading objects.

### 3. Presentation Layer
- **State Management:** Flutter BLoC for predictable, unidirectional data flow.
- **Widgets:** Highly atomic components (e.g., `StockTile`) designed for maximum reuse.
- **Pages:** Feature-specific views built using responsive layouts.

---

## 🧠 BLoC Logic Deep-Dive: Reorder/Swap Functionality

A core feature of the app is the dynamic Watchlist reordering. Handling list swaps in a reactive environment requires precision to prevent UI flickering or state corruption.

### The Logic
The `WatchlistBloc` handles the `_ReorderStocks` event by:
1.  **Validating Indices:** Ensuring `oldIndex` and `newIndex` are within bounds.
2.  **Immutability:** Creating a new list instance from the current state to respect the "State is Immutable" principle.
3.  **Index Normalization:** Adjusting the `targetIndex` if the item is moved downwards (as `ReorderableListView` provides the index *before* the item is removed).
4.  **State Emission:** Emitting a `_Loaded` state with the updated `unmodifiable` list, triggering a pinpoint UI rebuild.

```dart
// Snippet of the Reorder Logic
final reordered = List<StockModel>.from(currentList);
var targetIndex = event.newIndex;
if (targetIndex > event.oldIndex) targetIndex -= 1;

final movedItem = reordered.removeAt(event.oldIndex);
reordered.insert(targetIndex, movedItem);

emit(currentState.copyWith(
  watchlists: {...watchlists, selectedIndex: List.unmodifiable(reordered)}
));
```

---

## 🗺️ Navigation Strategy: GoRouter

The app utilizes **GoRouter** for declarative, type-safe navigation, providing several production benefits:

- **Deep Linking:** Native support for URL-based navigation, essential for future web/desktop parity.
- **Shell Routes:** Effortless implementation of persistent UI elements (like the Bottom Navigation Bar) using `ShellRoute`.
- **Declarative Logic:** Navigation is treated as a state, making it easier to handle complex authentication or redirect flows.
- **Error Handling:** Robust `errorBuilder` for gracefully handling "Coming Soon" or invalid routes.

---

## 💎 Quality Pillars

### 🔒 Type Safety
By leveraging **Freezed**, we ensure that our BLoCs and Data Models are immutable and type-safe. This eliminates runtime errors related to nullability or unexpected state mutations.

### 📱 Responsiveness
The app uses a custom `rs` (Responsive Size) helper utility. Unlike standard scaling, this logic applies tailored multipliers for Mobile, Tablet, and Desktop breakpoints, ensuring the "Glassmorphism" effect looks consistent across all screen ratios.

### ♻️ Code Reusability
- **Shared Widgets:** Common UI elements (Buttons, Tiles, Loaders) reside in `lib/shared/widget`.
- **Theme Extensions:** Centralized `AppColorScheme` and `TextTheme` allow for global style updates with zero friction.

---

## 📂 Folder Structure

```text
lib/
├── core/
│   ├── constants/       # App-wide constants
│   └── theme/           # Glassmorphism & Color schemes
├── features/
│   └── trading/
│       ├── data/        # Models & Data sources
│       ├── domain/      # Core entities
│       └── presentation/# BLoC, Pages, and Widgets
├── shared/
│   ├── helper/          # Responsive scaling & Dummy data
│   ├── routes/          # GoRouter configuration
│   └── widget/          # Atomic UI components
├── app.dart             # Root widget & Theme setup
└── main.dart            # Entry point
```

---

## 🛠️ Tech Stack
- **State Management:** `flutter_bloc`
- **Routing:** `go_router`
- **Code Generation:** `freezed`, `json_serializable`
- **UI:** Custom Glassmorphism implementation with `BackdropFilter`
