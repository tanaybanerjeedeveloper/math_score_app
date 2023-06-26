import 'package:flutter/material.dart';

class ScoreSummaryScreen extends StatelessWidget {
  const ScoreSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
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
                          DataColumn(label: Text('Batsmen')),
                          DataColumn(label: Text('R')),
                          DataColumn(label: Text('B')),
                          DataColumn(label: Text('4s')),
                          DataColumn(label: Text('6s')),
                          DataColumn(label: Text('Sr')),
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
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
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
                            DataCell(Text('data')),
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
                              'Rohit Sharma',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            SizedBox(
                              height: mediaQuery.height * 0.015,
                            ),
                            Text(
                              '112R (30b)',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: Color(0xff747C86), fontSize: 24),
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
  }
}
