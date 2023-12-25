import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/controller/mainscreen_provider.dart';
import 'package:shoes_shop/ui/cartpage.dart';
import 'package:shoes_shop/ui/homepage.dart';
import 'package:shoes_shop/ui/profile.dart';
import 'package:shoes_shop/ui/search.dart';

import '../views/shared/bottom_nav.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  List<Widget> pageList = const [
    HomePage(),
    SearchPage(),
    HomePage(),
    CartPage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) {
        return SafeArea(
          child: Scaffold(
            body: pageList[mainScreenNotifier.pageIndex],
            backgroundColor: const Color(0xFFE2E2E2),
            bottomNavigationBar: const BottomNavBar(),
          ),
        );
      },
    );
  }
}
