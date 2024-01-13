import 'package:cart_hero_animation/Commons/Views/All%20Fruits/view.dart';
import 'package:cart_hero_animation/Providers/all_fruits_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<AllFruitsProvider>(
      create: (_) => AllFruitsProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AllFruitsPage(),
    );
  }
}
