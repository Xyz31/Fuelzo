import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:team_project1/Home/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyD9_JiubxbkaKlUQM4MoqJNJ5RYKaSf4Xw",
          authDomain: "fuelzo-38d52.firebaseapp.com",
          projectId: "fuelzo-38d52",
          storageBucket: "fuelzo-38d52.appspot.com",
          messagingSenderId: "811412470818",
          appId: "1:811412470818:web:4b6bc8bd7e7407b9ca5e7b",
          measurementId: "G-FN5VY9HMTD"));
  runApp(const MyApp());
}

// Api Key = "AIzaSyAKVUN5xoFUGY_5OoGlJXceOooXEUXeBCY"

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent)),
      home: const MyHome(),
    );
  }
}
