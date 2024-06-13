
[![Pub Version](https://img.shields.io/badge/pub-v1.0.0+1-blue?style=flat-square&logo=dart&logoColor=white)](https://pub.dev/packages/example_package)

# db_username_suggester

A Flutter package for suggesting alternative usernames when a given username already exists in the database. This package helps ensure unique usernames by automatically generating and suggesting available alternatives based on the initial username input. It's designed to work seamlessly across all supported platforms, including iOS, Android, and web.

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
  db_username_suggester: ^1.0.0
```
2 Then, import the package into your Dart code:

```dart
import 'package:db_username_suggester/db_username_suggester.dart';
```

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

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

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.

## Flutter Version:
Flutter 3.22.0 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 5dcb86f68f (5 weeks ago) • 2024-05-09 07:39:20 -0500
Engine • revision f6344b75dc
Tools • Dart 3.4.0 • DevTools 2.34.3

