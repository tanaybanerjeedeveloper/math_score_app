import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:match_app/src/common_widgets/error_msg_widget.dart';
import 'package:match_app/src/features/score_summary/data/score_summary_repository.dart';

class ScoreCardScreen extends ConsumerWidget {
  final id;

  ScoreCardScreen({this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scoreSummaryData = ref.watch(fetchScoreSummaryProvider(id));

    final mediaQuery = MediaQuery.of(context).size;
    return scoreSummaryData.when(
      data: (data) {
        return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: ListView.builder(
              //padding: EdgeInsets.symmetric(vertical: 10),
              shrinkWrap: true,
              itemCount: data['response']['innings'].length,
              itemBuilder: (context, index) => Card(
                elevation: 2,
                child: ExpansionTile(
                  title: Text(data['response']['innings'][index]['name']),
                  children: [
                    Column(
                      children: [
                        SingleChildScrollView(
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
                              rows: data['response']['innings'][index]['fows']
                                  .map<DataRow>((item) => DataRow(cells: [
                                        DataCell(Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${item['batsman_id']}',
                                                style: TextStyle(
                                                    color: Color(0xff000088)),
                                              ),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  '${item['how_out']}',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xffA4AAB1)),
                                                ),
                                              )
                                            ],
                                          ),
                                        )),
                                        DataCell(Text('${item['runs']}')),
                                        DataCell(
                                            Text('${item['balls_faced']}')),
                                        DataCell(
                                            Text('${item['balls_faced']}')),
                                        DataCell(
                                            Text('${item['balls_faced']}')),
                                        DataCell(
                                            Text('${item['balls_faced']}')),
                                      ]))
                                  .toList(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: mediaQuery.height * 0.01,
                        ),
                        SingleChildScrollView(
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
                                  DataCell(Text(
                                    'Mitchell',
                                    style: TextStyle(color: Color(0xff000088)),
                                  )),
                                  DataCell(Text('5')),
                                  DataCell(Text('00')),
                                  DataCell(Text('00')),
                                  DataCell(Text('00')),
                                  DataCell(Text('00')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Blair',
                                      style:
                                          TextStyle(color: Color(0xff000088)))),
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
                      ],
                    ),
                  ],
                ),
              ),
            ));
      },
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stackTrace) => Center(
        child: ErrorMessageWidget(
          error.toString(),
        ),
      ),
    );
    // Scaffold(
    //     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    //     body: ListView.builder(
    //       //padding: EdgeInsets.symmetric(vertical: 10),
    //       shrinkWrap: true,
    //       itemCount: 2,
    //       itemBuilder: (context, index) => Card(
    //         elevation: 2,
    //         child: ExpansionTile(
    //           title: Text('india innings'),
    //           children: [
    //             Column(
    //               children: [
    //                 SingleChildScrollView(
    //                   scrollDirection: Axis.vertical,
    //                   child: SingleChildScrollView(
    //                     scrollDirection: Axis.horizontal,
    //                     child: DataTable(
    //                       columns: [
    //                         DataColumn(label: Text('Batsmen')),
    //                         DataColumn(label: Text('R')),
    //                         DataColumn(label: Text('B')),
    //                         DataColumn(label: Text('4s')),
    //                         DataColumn(label: Text('6s')),
    //                         DataColumn(label: Text('Sr')),
    //                       ],
    //                       rows: [
    //                         DataRow(cells: [
    //                           DataCell(Column(
    //                             children: [
    //                               Text(
    //                                 'KL Rahul',
    //                                 style: TextStyle(color: Color(0xff000088)),
    //                               ),
    //                             ],
    //                           )),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                         ]),
    //                         DataRow(cells: [
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                         ]),
    //                         DataRow(cells: [
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                         ]),
    //                         DataRow(cells: [
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                         ]),
    //                         DataRow(cells: [
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                         ]),
    //                         DataRow(cells: [
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                         ]),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   height: mediaQuery.height * 0.01,
    //                 ),
    //                 SingleChildScrollView(
    //                   scrollDirection: Axis.vertical,
    //                   child: SingleChildScrollView(
    //                     scrollDirection: Axis.horizontal,
    //                     child: DataTable(
    //                       columns: [
    //                         DataColumn(label: Text('Bowlers')),
    //                         DataColumn(label: Text('O')),
    //                         DataColumn(label: Text('M')),
    //                         DataColumn(label: Text('R')),
    //                         DataColumn(label: Text('W')),
    //                         DataColumn(label: Text('Eco')),
    //                       ],
    //                       rows: [
    //                         DataRow(cells: [
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                         ]),
    //                         DataRow(cells: [
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                         ]),
    //                         DataRow(cells: [
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                         ]),
    //                         DataRow(cells: [
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                         ]),
    //                         DataRow(cells: [
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                         ]),
    //                         DataRow(cells: [
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                           DataCell(Text('data')),
    //                         ]),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     ));
  }
}
