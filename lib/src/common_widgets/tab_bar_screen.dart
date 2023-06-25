import 'package:flutter/material.dart';
import 'package:match_app/src/features/score_card/score_card_screen.dart';
import 'package:match_app/src/features/score_summary/presentation/score_summary_screen.dart';

class TabbarScreen extends StatelessWidget {
  final id;
  TabbarScreen({this.id});

  @override
  Widget build(BuildContext context) {
    print('id: $id');
    final mediaQuery = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: mediaQuery.height * 0.075,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/image 5.png'),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          // color: Colors.red,
                          child: Center(
                              child: Image.asset('assets/images/image 1.png')),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.centerLeft,
                              children: [
                                // Icon(
                                //   Icons.account_balance_wallet,
                                //   color: Colors.white,
                                // ),
                                Container(
                                  child: Center(
                                      child: Text(
                                    '0000',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                  height: 32,
                                  width: 73,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                Positioned(
                                  left: -9,
                                  child: Icon(
                                    Icons.account_balance_wallet,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: mediaQuery.width * 0.02,
                            ),
                            const Icon(Icons.notifications),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  )),
              height: mediaQuery.height * 0.29,
            ),
            TabBar(
              indicatorColor: Theme.of(context).colorScheme.primary,
              tabs: [
                Tab(
                  child: Text(
                    'Summary',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                ),
                Tab(
                  //text: 'Summary',
                  child: Text(
                    'ScoreCard',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                )
              ],
            ),
            Expanded(
                child: TabBarView(
              children: [
                ScoreSummaryScreen(),
                ScoreCardScreen(),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
