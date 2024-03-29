
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/controller/mainscreen_provider.dart';
import 'package:shoes_shop/controller/product_provider.dart';
import 'package:shoes_shop/ui/mainscreen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => MainScreenNotifier()),
    ChangeNotifierProvider(create: (context)=> ProductNotifier())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MainScreen());
  }
}
