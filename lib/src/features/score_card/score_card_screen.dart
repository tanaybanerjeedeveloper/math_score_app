import 'package:flutter/material.dart';

class ScoreCardScreen extends StatelessWidget {
  const ScoreCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: ListView.builder(
          //padding: EdgeInsets.symmetric(vertical: 10),
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (context, index) => Card(
            elevation: 2,
            child: ExpansionTile(
              title: Text('india innings'),
              children: [
                Column(
                  children: [
                    SingleChildScrollView(
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
                              DataCell(Column(
                                children: [
                                  Text(
                                    'KL Rahul',
                                    style: TextStyle(color: Color(0xff000088)),
                                  ),
                                ],
                              )),
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
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
