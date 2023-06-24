import 'package:flutter/material.dart';

class MatchListScreen extends StatelessWidget {
  const MatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Text(
          'Match list sscrn',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
