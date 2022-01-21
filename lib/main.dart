import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:numbored/home/home_screen.dart';
import 'package:numbored/routes.dart';
import 'package:numbored/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Numbored',
      theme: appTheme,
      routes: appRoutes,
    );
  }
}
