import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:team_project1/Home/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBbWzneSRDUVrHGjnQ7ctbFlnhbT-RNdzA",
          authDomain: "team-project1-28a2b.firebaseapp.com",
          projectId: "team-project1-28a2b",
          storageBucket: "team-project1-28a2b.appspot.com",
          messagingSenderId: "319919531248",
          appId: "1:319919531248:web:884e580d6b3fb3019d4e35",
          measurementId: "G-055ZQMRZ7C"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow)),
      home: MyHome(),
    );
  }
}
