import 'package:flutter/material.dart';
import 'package:flutter_rpg/screens/home/home_screen.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CharacterStore(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: primaryTheme,
      home: const HomeScreen(),
    ),
  ));
}

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sandbox"),
        backgroundColor: Colors.grey,
      ),
      body: const Text("sandbox"),
    );
  }
}
