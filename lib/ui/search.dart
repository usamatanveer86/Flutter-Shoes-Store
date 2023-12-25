import 'package:flutter/material.dart';

import '../views/shared/appstyle.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'This is SearchPage',
        style: appstyle(26, Colors.black, FontWeight.bold),
      )),
    );
  }
}
