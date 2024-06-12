
[![Pub Version](https://img.shields.io/badge/pub-v1.0.0-blue?style=flat-square&logo=dart&logoColor=white)](https://pub.dev/packages/example_package)
# db_username_suggester

<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

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

