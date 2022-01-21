import 'package:flutter/material.dart';
import 'package:numbored/game/game_screen.dart';
import 'package:numbored/login/login_screen.dart';
import 'package:numbored/services/auth.dart';
import 'package:numbored/shared/shared.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasError) {
          return const Center(
            child: ErrorMessage(),
          );
        } else if (snapshot.hasData) {
          return const GameScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
