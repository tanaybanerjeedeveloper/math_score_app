import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:match_app/src/common_widgets/error_msg_widget.dart';
import 'package:match_app/src/features/score_summary/data/score_summary_repository.dart';

class ScoreSummaryScreen extends ConsumerWidget {
  final id;
  ScoreSummaryScreen({required this.id});

  dynamic findTheBestPartnership(List list) {
    var bestPartnership = list[0];

    for (var i = 0; i < list.length; i++) {
      if (list[i]['runs'] > bestPartnership['runs']) {
        bestPartnership = list[i];
      }
    }
    return bestPartnership;
  }

  findTheBestPlayer(Map bestPartnership) {
    var bestPlayer = bestPartnership['batsmen'][0];
    for (var i = 0; i < bestPartnership['batsmen'].length; i++) {
      if (bestPartnership['batsmen'][i]['runs'] > bestPlayer['runs']) {
        bestPlayer = bestPartnership['batsmen'][i];
      }
    }
    return bestPlayer;
  }

  dynamic findTheWinner(List list) {
    var winner = list[0];
    for (var i = 0; i < list.length; i++) {
      if (list[i]['runs'] > winner['runs']) {
        winner = list[i];
      }
    }
    return winner;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scoreSummaryData = ref.watch(fetchScoreSummaryProvider(id));
    final mediaQuery = MediaQuery.of(context).size;

    return scoreSummaryData.when(
      data: (data) {
        print('data: $data');
        var winner = findTheWinner(data['response']['innings']);
        print('partnership: ${winner['statistics']['partnership']}');
        print('winner:---- $winner');
        var bestPartnership =
            findTheBestPartnership(winner['statistics']['partnership']);
        print('bestPartnership: $bestPartnership');
        var bestPlayer = findTheBestPlayer(bestPartnership);
        print('bestPlayer:--------$bestPlayer');
        return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: mediaQuery.height * 0.02,
                    ),
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                              columns: [
                                DataColumn(label: Text('Batsmen id')),
                                DataColumn(label: Text('R')),
                                DataColumn(label: Text('B')),
                                DataColumn(label: Text('4s')),
                                DataColumn(label: Text('6s')),
                                DataColumn(label: Text('Sr')),
                              ],
                              rows: bestPartnership['batsmen']
                                  .map<DataRow>((item) => DataRow(cells: [
                                        DataCell(Text('${item['batsman_id']}')),
                                        DataCell(Text('${item['runs']}')),
                                        DataCell(
                                            Text('${item['balls_faced']}')),
                                        DataCell(Text('${item['fours']}')),
                                        DataCell(Text('${item['sixes']}')),
                                        DataCell(Text('00')),
                                      ]))
                                  .toList()),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.height * 0.01,
                    ),
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columns: [
                              DataColumn(label: Text('Bowlers')),
                              DataColumn(label: Text('O')),
                              DataColumn(label: Text('M')),
                              DataColumn(label: Text('R')),
                              DataColumn(label: Text('W')),
                              DataColumn(label: Text('Eco')),
                            ],
                            rows: [
                              DataRow(cells: [
                                DataCell(Text('Mitchell')),
                                DataCell(Text('5')),
                                DataCell(Text('00')),
                                DataCell(Text('00')),
                                DataCell(Text('00')),
                                DataCell(Text('00')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Blair')),
                                DataCell(Text('5')),
                                DataCell(Text('00')),
                                DataCell(Text('00')),
                                DataCell(Text('00')),
                                DataCell(Text('00')),
                              ]),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.height * 0.01,
                    ),
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Player of The Match',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: Color(
                                          0xff747C86,
                                        ),
                                        fontSize: 17,
                                      ),
                                ),
                                SizedBox(
                                  height: mediaQuery.height * 0.015,
                                ),
                                Text(
                                  '${bestPlayer['batsman_id']}',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                SizedBox(
                                  height: mediaQuery.height * 0.015,
                                ),
                                Text(
                                  '${bestPlayer['runs']}R (${bestPlayer['balls_faced']}b)',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: Color(0xff747C86),
                                          fontSize: 24),
                                ),
                              ],
                            ),
                            Image.asset(
                              'assets/images/face2.png',
                              width: mediaQuery.width * 0.2,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.height * 0.01,
                    ),
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Date'),
                                Text('10:00 AM Sunday, June 04, 2023')
                              ],
                            ),
                            SizedBox(
                              height: mediaQuery.height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Toss'),
                                Text('INDIA won the toss and opt to bat')
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Center(
        child: ErrorMessageWidget(
          error.toString(),
        ),
      ),
    );
  }
}
