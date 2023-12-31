import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:match_app/src/common_widgets/match_card.dart';
import 'package:match_app/src/routing/app_router.dart';
import 'package:match_app/src/utils/fake_data.dart';

class MatchListScreen extends StatelessWidget {
  const MatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: matches.length,
          itemBuilder: (context, index) => Center(
            child: GestureDetector(
              onTap: () =>
                  context.pushNamed(AppRoute.tabbarScreen.name, queryParams: {
                'id': matches[index]['id'],
              }),
              child: MatchCard(
                date: matches[index]['date'],
                id: matches[index]['id'],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
