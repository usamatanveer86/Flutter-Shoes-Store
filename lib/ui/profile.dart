import 'package:flutter/material.dart';

import '../views/shared/appstyle.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'This is ProfilePage',
        style: appstyle(26, Colors.black, FontWeight.bold),
      )),
    );
  }
}
