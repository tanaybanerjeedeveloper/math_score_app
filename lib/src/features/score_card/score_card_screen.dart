import 'package:flutter/material.dart';

class ScoreCardScreen extends StatelessWidget {
  const ScoreCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Text('Score card screem'),
      ),
    );
  }
}
