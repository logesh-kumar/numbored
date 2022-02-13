import 'package:flutter/widgets.dart';
import 'package:numbored/services/auth.dart';
import 'package:numbored/services/models.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var report = Provider.of<Report>(context);
    var user = AuthService().user;
    if (user != null) {
      // add your UI here
      print(user);
    }
    return const Text("Profile");
  }
}
