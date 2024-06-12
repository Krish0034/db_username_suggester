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
