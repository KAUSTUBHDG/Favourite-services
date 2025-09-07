# favorite_services_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# 📱 Favourite Services App

A Flutter application built with **Clean Architecture**, **SOLID principles**, and **Bloc for state management**.  
The app fetches services from the [JSONPlaceholder API](https://jsonplaceholder.typicode.com/posts), displays them in a scrollable list, and allows users to **favorite/unfavorite** services with local persistence (Hive/SQLite).  

---

## ✨ Features

- Fetches services using **Dio** (`GET /posts` from JSONPlaceholder).
- Displays **All Services** and **Favorites** in a **tabbed view**.
- Users can **favorite/unfavorite** services via a heart icon.
- **Local persistence** of favorites with Hive/SQLite.
- Infinite scrolling / **lazy loading** for large lists.
- Built using **Bloc** for predictable state management.
- Written with **Stateless widget driven UI** (no function-driven widgets).
- Includes **unit tests** and **integration tests**.

---

## 🏗️ Architecture

The app follows **Clean Architecture** principles:


- **Bloc** manages state and events (`DashboardBloc`).
- **Dio** handles networking.
- **Hive/SQLite** stores favorite IDs.
- **Entity-driven design** separates layers.

---

## 🚀 Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (latest stable)
- [Xcode](https://developer.apple.com/xcode/) for iOS builds
- [Android Studio](https://developer.android.com/studio) / Android SDK for Android builds

### Installation

```bash
# Clone the repo
git clone https://github.com/name/Favourite-services.git
cd Favourite-services

# Get dependencies
flutter pub get

# Run build_runner (if using freezed/json_serializable)
flutter pub run build_runner build --delete-conflicting-outputs

# Run the app
flutter run

# Run unit & widget tests
flutter test

# Run integration tests
flutter test integration_test
