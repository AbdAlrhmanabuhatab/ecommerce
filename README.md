# 🛍️ Wizo — Modern E-Commerce Flutter Application

[![Flutter Version](https://img.shields.io/badge/Flutter-3.x%20%7C%20Dart%203.x-02569B?logo=flutter)](https://flutter.dev)
[![Analysis](https://img.shields.io/badge/Flutter%20Analyze-0%20Issues-brightgreen)](https://dart.dev/tools/analysis)
[![Tests](https://img.shields.io/badge/Unit%20%26%20Widget%20Tests-Passing-success)](https://flutter.dev/to/widget-testing)
[![Architecture](https://img.shields.io/badge/Architecture-Feature--First%20Clean%20Architecture-blueviolet)](#architecture--structure)

An enterprise-ready, modular, and highly scalable E-Commerce mobile application built with **Flutter**, designed specifically to showcase **Software Engineering Best Practices**, clean architecture principles, and responsive UI/UX design.
<img width="1672" height="941" alt="عرض تطبيق ويزو للتجارة الإلكترونية" src="https://github.com/user-attachments/assets/68878f80-b99a-40c2-92f1-4261dbd50feb" />


---

## 🏛️ Architecture & Project Structure

The project strictly adheres to **Feature-First Clean Architecture** with **Low Coupling and High Cohesion**:

```text
lib/
├── core/                                # Shared foundational layer
│   ├── constants/                       # App-wide constants
│   │   ├── app_assets.dart              # Type-safe asset references
│   │   ├── app_colors.dart              # Material 3 centralized design palette
│   │   └── app_dimens.dart              # Spacing, padding & radius standards
│   ├── theme/                           # Global theme configuration
│   │   └── app_theme.dart               # Material 3 light theme & widget styles
│   └── widgets/                         # Reusable core widgets (DRY Principle)
│       ├── badge_icon.dart              # Notification & cart badges
│       ├── cart_floating_action_button.dart # Floating cart button with dynamic badge
│       ├── custom_ecommerce_app_bar.dart    # Custom app bar with branding & actions
│       ├── custom_ecommerce_bottom_bar.dart # Notched navigation bar
│       └── section_header.dart          # Responsive header with overflow protection
│
├── features/                            # Encapsulated domain feature modules
│   ├── home/                            # Home feature module
│   │   ├── data/                        # Data layer
│   │   │   ├── datasources/             # Mock & remote data sources
│   │   │   │   └── mock_data_source.dart
│   │   │   └── models/                  # Immutable domain models
│   │   │       ├── category_model.dart
│   │   │       └── product_model.dart
│   │   └── presentation/                # UI Presentation layer
│   │       ├── screens/                 # Screens
│   │       │   └── home_screen.dart
│   │       └── widgets/                 # Feature-specific atomic widgets
│   │           ├── category_item.dart
│   │           ├── category_list_view.dart
│   │           ├── product_card.dart
│   │           ├── promo_banner.dart
│   │           └── search_bar_widget.dart
│   │
│   └── product_details/                 # Product Details module
│       └── presentation/
│           ├── screens/
│           │   └── product_details_screen.dart
│           └── widgets/
│               ├── product_bottom_action_bar.dart
│               ├── product_color_selector.dart
│               ├── product_description_section.dart
│               ├── product_image_header.dart
│               ├── product_info_header.dart
│               ├── product_ratings_row.dart
│               └── product_specifications_section.dart
│
├── details.dart                         # Backward-compatible adapter
├── homepage.dart                        # Backward-compatible adapter
└── main.dart                            # Application entry point & ScreenUtil config
```

---

## 💎 Engineering Highlights & Quality Standards

| Quality Metric | Implementation Details |
|---|---|
| **Readability** | Strongly typed models (`ProductModel`, `CategoryModel`), clear self-documenting code, descriptive naming conventions, and dartdoc comments. |
| **Maintainability** | Monolithic files eliminated and decomposed into single-responsibility atomic components. Centralized styling via `AppColors` and `AppTheme`. |
| **Modularity** | Feature-First layering separating presentation, data models, and core utilities. |
| **Reusability** | Standalone widgets (`BadgeIcon`, `SectionHeader`, `ProductCard`, `CartFloatingActionButton`) ready for reuse across any view. |
| **Scalability** | Easy swap of `MockDataSource` with REST API (Dio) or GraphQL without touching presentation widgets. |
| **Performance** | Rigorous use of `const` constructors to prevent unnecessary rebuilds; Hero transitions; optimized list rendering. |
| **Reliability** | Fixed brittle pixel spacers with responsive layout widgets; zero deprecated APIs (migrated to `WidgetStateProperty`); 100% null-safe. |
| **Consistency** | Standardized padding, border radiuses, typography, and color tokens across all screens. |
| **Low Coupling** | Widgets receive clear parameters or immutable models rather than unstructured maps or global states. |

---

## 🧪 Testing Suite

Comprehensive unit and widget tests covering:
- **Unit Tests (`test/models/`):** Model serialization, `copyWith`, price formatting, edge-case parsing.
- **Widget Tests (`test/` & `test/features/`):** Full app smoke testing, screen rendering, quantity increment/decrement, and interactive color picking.

To run tests:
```bash
flutter test
```

To run static analysis:
```bash
flutter analyze
```

---

## 🚀 Getting Started

1. **Clone the repository:**
   ```bash
   git clone <repo-url>
   cd ecommerce2
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```
