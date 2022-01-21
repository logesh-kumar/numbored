import 'package:numbored/about/about_screen.dart';
import 'package:numbored/game/game_screen.dart';
import 'package:numbored/home/home_screen.dart';
import 'package:numbored/login/login_screen.dart';
import 'package:numbored/profile/profile_screen.dart';

var appRoutes = {
  "/": (context) => const HomeScreen(),
  "/game": (context) => const GameScreen(),
  "/login": (context) => const LoginScreen(),
  "/about": (context) => const AboutScreen(),
  "/profile": (context) => const ProfileScreen()
};
