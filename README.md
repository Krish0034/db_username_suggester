
[![Pub Version](https://img.shields.io/badge/pub-v1.0.0+2-blue?style=flat-square&logo=dart&logoColor=white)](https://pub.dev/packages/example_package)

## db_username_suggester

A Flutter package for suggesting alternative usernames when a given username already exists in the database. This package helps ensure unique usernames by automatically generating and suggesting available alternatives based on the initial username input.


---

Created By Krishn Kumar (`https://github.com/Krish0034`)

[![Buy Me a Coffee](https://img.shields.io/badge/Buy%20Me%20a%20Coffee-F7BA2A?style=for-the-badge&logo=buy-me-a-coffee&logoColor=black)](https://buymeacoffee.com/krish0034)


---

## Features

- Suggests alternative usernames if the desired username is taken.
- Customizable username field widget.
- Supports asynchronous checks for username availability in the database.
- Configurable error messages, hints, and styles.
- Compatible with iOS, Android, and web platforms.

## Installation 📦

1 To use this package, add `db_username_suggester` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  db_username_suggester: ^1.0.0+2
```
2 Then, import the package into your Dart code:

```dart
import 'package:db_username_suggester/db_username_suggester.dart';
```

## Usage

Here's a simple example that shows how to use the `DbUsernameSuggesterField` widget:

```dart
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:db_username_suggester/db_username_suggester.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Username Plugin example app'),
          ),
          body:Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Column(
              children: [
                DbUsernameSuggesterField(
                  label: "Username",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a username';
                    }
                    return null;
                  },
                  checkUsernameInDb: (username) async {
                    /// Replace with your logic to check if the username exists in the DB
                    if(username.isNotEmpty && username=='username'){
                      return Future.value(true);
                    }
                    else
                    {
                      return Future.value(false);
                    }
                  },
                  textCapitalization: TextCapitalization.none,
                  onChange: (value) {
                    print('Username changed: $value');
                  },
                  borderRadius: BorderRadius.circular(10),
                  hintText: "Please Enter Username.",
                  hintTextStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.black.withOpacity(0.5)),
                  borderColor: Colors.green,
                  errorText: "Please Enter username for checking user name is exist or not",
                ),
              ],
            ),
          )
      ),
    );
  }
}

```


### Properties Usage ⚙️

#### `DbUsernameSuggesterField`

| Property           | Type                    | Description                                                                                  |
|--------------------|-------------------------|----------------------------------------------------------------------------------------------|
| Label              | `label`                 | Specifies the label for the username input field.                                            |
| Validator          | `validator`             | A function to validate the username input. Returns an error message if the validation fails. |
| CheckUsernameInDb  | `checkUsernameInDb`     | A function that checks if the username exists in the database. Should return a Future<bool>. |
| TextCapitalization | `textCapitalization`    | Defines how the text should be capitalized (e.g., none, words, sentences).                   |
| OnChange           | `onChange`              | Initial or final destination for sliding or fading effects.                                  |
| BorderRadius       | `borderRadius`          | Specifies the border radius of the input field.                                              |
| HintText           | `hintText`              | Hint text displayed inside the input field when it is empty.                                 |
| HintTextStyle      | `hintTextStyle`         | Style applied to the hint text.                                                              |
| BorderColor        | `borderColor`           | Color of the input field border.                                                             |
| ErrorText          | `errorText`             | Error message displayed when the username validation fails.                                  |


## Platform Support 🌐

- **Android:** Supported on SDK 16 and above.
- **iOS:** Supported on iOS 11.0 and above.
- **Web:** Supported on all modern web browsers.
- **Linux:** Supported on any Linux distribution.
- **macOS:** Supported on macOS 10.14 and above.
- **Windows:** Supported on all Windows versions.


## More information

- **Pub Package:** Provides a direct link to the package page on pub.dev where users can find more detailed information, version history, and installation instructions.
- **Flutter Documentation:** Links to the official Flutter documentation, serving as a resource for general information, guides, and best practices related to Flutter development.



