import 'package:numbored/about/about_screen.dart';
import 'package:numbored/home/home_screen.dart';
import 'package:numbored/login/login_screen.dart';
import 'package:numbored/profile/profile_screen.dart';
import 'package:numbored/topics/topics_screen.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/topics': (context) => const TopicsScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/about': (context) => const AboutScreen(),
};
