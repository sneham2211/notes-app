import 'package:flutter/material.dart';
import 'package:notes_app/Screens/signInScreen.dart';
import 'package:notes_app/Screens/welcomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
  title: 'Notes App',
  themeMode: ThemeMode.system,
  theme: ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  ),
  darkTheme: ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.dark,
    ),
  ),
  initialRoute: '/',
  routes: {
    '/': (context) => const WelcomeScreen(),
    '/signin': (context) => const SignInScreen(),
  },
);
