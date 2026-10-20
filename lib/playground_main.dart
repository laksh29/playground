import 'package:flutter/material.dart';
import 'package:playground/home/playgroud_home_screen.dart';

class PlaygroundMainScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PlaygroudHomeScreen(),
    );
  }
}
