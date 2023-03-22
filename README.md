

# TwseInfoApp 📈
- This is a sample stock info application of Taiwan 🇹🇼.
- Uses MVVM pattern, Clean architecture principle 👨‍💻.

### Getting Started 🚀

- Download the repo
- Install dependencies

```dart
flutter pub upgrade
```

### Architecture 🏠 (MVVM + Clean architecture)

```dart
// Relationship with each part
Screen <-> ViewModel <-> UseCase(Dto) <-> Repository(Model) or DataBase(Entity) 
```

### Screen 📱
- Screen is the collection of visible elements, which also receives user input.

```dart
// Path of file
/presentation/home/home_screen.dart
```

### ViewModel 🕹
- ViewModel is located between the View and Model layers.
```dart
// Path of file
/presentation/home/home_view_model.dart
```

### Model (Data) 💾
Model houses the logic for the program, which is retrieved by the ViewModel upon its own receipt of input from the user through View. Components of data layer include:
- __model__
	- __dto__: Defines dto of ui model, also perform data transformation between ```domain```, ```response``` and ```entity``` models.
	- __local__: Defines the schema of SQLite database.
	- __remote__: Defines data of network responses.
- __local__: This is responsible for performing caching operations using [Drift](https://pub.dev/packages/drift).
- __remote__: This is responsible for performing network operations.
- __repository__: Responsible for exposing data to the domain layer.

```dart
// Path of folder
/data/local
/data/remote
/data/model/dto
/data/repository
```

### Utils 🧰
- Any additional helpers or strings are put inside the utils like date and number formatter.
```dart
// Path of file
/utils/string_ext.dart
```

### Testing 🛠
- Unit tests of repository test and view model test.

```dart
// Path of folder
/test/repo
/test/view_model
```

- Integration test with robot
```dart
// Path of folder
/integration_test/robots
/integration_test/app_test.dart
```

- Run the cmd

```dart
flutter drive \
--driver=test_driver/integration_test.dart \
--target=integration_test/app_test.dart

flutter test --coverage
```

## Packages 🚅

- [Stacked](https://pub.dev/packages/stacked) - An architecture and widgets for an MVVM in Flutter.
- [Get It](https://pub.dev/packages/get_it) - Dependency Injection library.
- [Go Router](https://pub.dev/packages/go_router) - Navigation
- [Url Launcher](https://pub.dev/packages/url_launcher) - A Flutter plugin for launching a URL.
- [Drift](https://pub.dev/packages/drift) - Drift is a reactive persistence library for Flutter and Dart, built on top of sqlite.
- [Mockito](https://pub.dev/packages/mockito) - Mock library for Dart inspired by [Mockito](https://github.com/mockito/mockito)

This doc is inspired from [AseemWangoo](https://github.com/AseemWangoo) and [developersancho](https://github.com/developersancho)
