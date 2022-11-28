import 'package:flutter/material.dart';
import 'package:snack/screens/login_screen.dart';
import 'package:snack/screens/home_screen.dart';
import 'package:snack/screens/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:snack/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      routes: {
        "/": (context) => OnboardingScreen(),
        "/home": (context) => HomeScreen(),
        "/login": (context) => const LoginScreen(),
      },
    );
  }
}
