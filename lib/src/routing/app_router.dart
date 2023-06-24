import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:match_app/src/features/matchList/presentation/matchList_screen.dart';
import 'package:match_app/src/features/score_card/score_card_screen.dart';
import 'package:match_app/src/features/score_summary/presentation/score_summary_screen.dart';

enum AppRoute {
  home,
  scoreSummary,
  scoreCard,
}

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: false,
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) => const MatchListScreen(),
      routes: [
        GoRoute(
          path: 'match/scorecard/:id',
          name: AppRoute.scoreCard.name,
          pageBuilder: (context, state) {
            final matchID = state.params['matchid']!;
            return MaterialPage(
              key: state.pageKey,
              fullscreenDialog: true,
              child: const ScoreCardScreen(),
            );
          },
        ),
        GoRoute(
          path: 'match/scoresummary/:id',
          name: AppRoute.scoreSummary.name,
          pageBuilder: (context, state) {
            final matchID = state.params['matchid']!;
            return MaterialPage(
              key: state.pageKey,
              fullscreenDialog: true,
              child: const ScoreSummaryScreen(),
            );
          },
        ),
      ],
    )
  ],
);
