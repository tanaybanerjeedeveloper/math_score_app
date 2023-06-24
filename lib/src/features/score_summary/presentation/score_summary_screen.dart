import 'package:flutter/material.dart';

class ScoreSummaryScreen extends StatelessWidget {
  const ScoreSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Text('score summary'),
      ),
    );
  }
}
