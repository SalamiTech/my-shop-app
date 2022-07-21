# Flutter Boilerplate

Boilerplate template for all my opensource flutter projects.

## How to Use

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/codekeyz/flutter_boilerplate.git
```

**Step 2:**

Go to project root and execute the following command in console to fetch dependencies:

```
flutter pub get
```

**Step 3:**

This project uses libraries that work with code generation, execute the following command to generate files:

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

or watch command in order to keep the source code synced automatically:

```
flutter packages pub run build_runner watch
```

## Boilerplate Features:

- Routing - [AutoRouter](https://pub.dev/packages/auto_route)
- State Management - [Provider](https://pub.dev/packages/provider)
- JSON Parse / Serialization - [Json_Serializable](https://pub.dev/packages/json_serializable)
- Dependency Injection - [Service Locator](https://pub.dev/packages/get_it)
- Multiplatform Refresh Wrapper Widget
- Overlay Loading Screen
- EmptyState Widget

### Up-Coming Features:

- Network Client
