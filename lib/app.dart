import 'package:flutter/material.dart';
import 'package:learn_pagination/screens/home_screen.dart';

class UserApp extends StatelessWidget {
  const UserApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.dark,
      home: const HomeScreen(),
    );
  }
}
