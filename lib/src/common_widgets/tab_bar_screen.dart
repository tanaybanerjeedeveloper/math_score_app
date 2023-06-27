import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:match_app/src/common_widgets/error_msg_widget.dart';
import 'package:match_app/src/features/score_card/score_card_screen.dart';
import 'package:match_app/src/features/score_summary/data/score_summary_repository.dart';
import 'package:match_app/src/features/score_summary/presentation/score_summary_screen.dart';

class TabbarScreen extends ConsumerWidget {
  final id;
  var runsIND;
  var runsAUS;
  TabbarScreen({this.id});

  dynamic findTheWinner(List list) {
    var winner = list[0];
    for (var i = 0; i < list.length; i++) {
      if (list[i]['runs'] > winner['runs']) {
        winner = list[i];
      }
    }
    return winner;
  }

  List findTeamRuns(List list) {
    for (var i = 0; i < list.length; i++) {
      if (list[i]['name'] == 'Australia Innings') {
        runsAUS = list[i]['runs'];
      } else {
        runsIND = list[i]['runs'];
      }
    }
    return [runsAUS, runsIND];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('id: $id');
    final scoreSummaryData = ref.watch(fetchScoreSummaryProvider(id));

    final mediaQuery = MediaQuery.of(context).size;
    return scoreSummaryData.when(
      data: (data) {
        var winner = findTheWinner(data['response']['innings']);
        var runs = findTeamRuns(data['response']['innings']);
        print('winner:---- $winner');
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            body: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: mediaQuery.height * 0.045,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 8.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () => context.pop(),
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: mediaQuery.height * 0.022,
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                //color: Colors.red,
                                alignment: Alignment.centerLeft,
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundImage:
                                      AssetImage('assets/images/image 5.png'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                //color: Colors.black,
                                alignment: Alignment.center,
                                // color: Colors.red,
                                child: Center(
                                    child: Image.asset(
                                        'assets/images/image 1.png')),
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
                                            borderRadius:
                                                BorderRadius.circular(10)),
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
                                  const Icon(
                                    Icons.notifications,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ), //this is the end.
                      SizedBox(
                        height: mediaQuery.height * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundImage:
                                        AssetImage('assets/images/in.png'),
                                  ),
                                  SizedBox(
                                    width: mediaQuery.width * 0.02,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'IND',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(color: Color(0xffCCE2FF)),
                                      ),
                                      SizedBox(
                                        height: mediaQuery.height * 0.01,
                                      ),
                                      SizedBox(
                                        width: mediaQuery.width * 0.05,
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            '${runsIND}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  //fontSize: 2,
                                                  color: Colors.white,
                                                ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                // color: Colors.red,
                                child: Center(
                                  child: Text(
                                    'Complete',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'AUS',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(color: Color(0xffCCE2FF)),
                                      ),
                                      SizedBox(
                                        height: mediaQuery.height * 0.01,
                                      ),
                                      SizedBox(
                                        width: mediaQuery.width * 0.05,
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            '${runs[0]}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  //fontSize: 18,
                                                  color: Colors.white,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: mediaQuery.width * 0.025,
                                  ),
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundImage:
                                        AssetImage('assets/images/au.png'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: mediaQuery.height * 0.010,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(
                          color: Color(0xffE4E5E7),
                        ),
                      ),
                      SizedBox(
                        height: mediaQuery.height * 0.010,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  (runsAUS > runsIND)
                                      ? Text(
                                          'Australia Won',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                        )
                                      : Text(
                                          'India Won',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                        ),
                                  SizedBox(
                                    height: mediaQuery.height * 0.010,
                                  ),
                                  (runsAUS > runsIND)
                                      ? Text(
                                          'By ${runsAUS - runsIND} Runs',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                fontSize: 16,
                                                color: Color(0xffA4AAB1),
                                              ),
                                        )
                                      : Text(
                                          'By ${runsIND - runsAUS} Runs',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                fontSize: 16,
                                                color: Color(0xffA4AAB1),
                                              ),
                                        ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Last 6 Ball',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                  ),
                                  SizedBox(
                                    height: mediaQuery.height * 0.010,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Colors.white,
                                        child: CircleAvatar(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 2,
                                            ),
                                            child: Text(
                                              '1',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10),
                                            ),
                                          ),
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          radius: 9,
                                        ),
                                      ),
                                      SizedBox(width: mediaQuery.width * 0.02),
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Colors.white,
                                        child: CircleAvatar(
                                          backgroundColor: Color(0xffF5F9FF),
                                          radius: 9,
                                          child: Text(
                                            '4',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: mediaQuery.width * 0.02),
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Colors.white,
                                        child: CircleAvatar(
                                          backgroundColor: Color(0xff2A2A2A),
                                          radius: 9,
                                          child: Text(
                                            'WK',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: mediaQuery.width * 0.02),
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Colors.white,
                                        child: CircleAvatar(
                                          backgroundColor: Color(0xffF5F9FF),
                                          radius: 9,
                                          child: Text(
                                            '6',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: mediaQuery.width * 0.02),
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Colors.white,
                                        child: CircleAvatar(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 2,
                                            ),
                                            child: Text(
                                              'LB',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10),
                                            ),
                                          ),
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          radius: 9,
                                        ),
                                      ),
                                      SizedBox(width: mediaQuery.width * 0.02),
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Colors.white,
                                        child: CircleAvatar(
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          radius: 9,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      )),
                  height: mediaQuery.height * 0.40,
                  padding: EdgeInsets.symmetric(
                      horizontal: mediaQuery.width * 0.008),
                ),
                TabBar(
                  indicatorColor: Theme.of(context).colorScheme.primary,
                  tabs: [
                    Tab(
                      child: Text(
                        'Summary',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                    Tab(
                      //text: 'Summary',
                      child: Text(
                        'ScoreCard',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    )
                  ],
                ),
                Expanded(
                    child: TabBarView(
                  children: [
                    ScoreSummaryScreen(id: id),
                    ScoreCardScreen(id: id),
                  ],
                ))
              ],
            ),
          ),
        );
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

    // DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     body: Column(
    //       children: [
    //         Container(
    //           child: Column(
    //             children: [
    //               SizedBox(
    //                 height: mediaQuery.height * 0.075,
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Row(
    //                   //mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Expanded(
    //                       child: Container(
    //                         //color: Colors.red,
    //                         alignment: Alignment.centerLeft,
    //                         child: CircleAvatar(
    //                           radius: 15,
    //                           backgroundImage:
    //                               AssetImage('assets/images/image 5.png'),
    //                         ),
    //                       ),
    //                     ),
    //                     Expanded(
    //                       child: Container(
    //                         //color: Colors.black,
    //                         alignment: Alignment.center,
    //                         // color: Colors.red,
    //                         child: Center(
    //                             child:
    //                                 Image.asset('assets/images/image 1.png')),
    //                       ),
    //                     ),
    //                     Expanded(
    //                       child: Row(
    //                         mainAxisAlignment: MainAxisAlignment.end,
    //                         children: [
    //                           Stack(
    //                             clipBehavior: Clip.none,
    //                             alignment: Alignment.centerLeft,
    //                             children: [
    //                               // Icon(
    //                               //   Icons.account_balance_wallet,
    //                               //   color: Colors.white,
    //                               // ),
    //                               Container(
    //                                 child: Center(
    //                                     child: Text(
    //                                   '0000',
    //                                   style: TextStyle(color: Colors.white),
    //                                 )),
    //                                 height: 32,
    //                                 width: 73,
    //                                 decoration: BoxDecoration(
    //                                     border: Border.all(
    //                                       color: Colors.white,
    //                                     ),
    //                                     borderRadius:
    //                                         BorderRadius.circular(10)),
    //                               ),
    //                               Positioned(
    //                                 left: -9,
    //                                 child: Icon(
    //                                   Icons.account_balance_wallet,
    //                                   color: Colors.white,
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                           SizedBox(
    //                             width: mediaQuery.width * 0.02,
    //                           ),
    //                           const Icon(
    //                             Icons.notifications,
    //                             color: Colors.white,
    //                           ),
    //                         ],
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //               ), //this is the end.
    //               SizedBox(
    //                 height: mediaQuery.height * 0.02,
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
    //                 child: Row(
    //                   children: [
    //                     Expanded(
    //                       child: Row(
    //                         mainAxisAlignment: MainAxisAlignment.start,
    //                         children: [
    //                           CircleAvatar(
    //                             radius: 20,
    //                             backgroundImage:
    //                                 AssetImage('assets/images/in.png'),
    //                           ),
    //                           SizedBox(
    //                             width: mediaQuery.width * 0.02,
    //                           ),
    //                           Column(
    //                             crossAxisAlignment: CrossAxisAlignment.start,
    //                             children: [
    //                               Text(
    //                                 'IND',
    //                                 style: Theme.of(context)
    //                                     .textTheme
    //                                     .bodyMedium!
    //                                     .copyWith(color: Color(0xffCCE2FF)),
    //                               ),
    //                               SizedBox(
    //                                 height: mediaQuery.height * 0.01,
    //                               ),
    //                               SizedBox(
    //                                 width: mediaQuery.width * 0.15,
    //                                 child: FittedBox(
    //                                   child: Text(
    //                                     '000(00.0)',
    //                                     style: Theme.of(context)
    //                                         .textTheme
    //                                         .bodyMedium!
    //                                         .copyWith(
    //                                           fontSize: 18,
    //                                           color: Colors.white,
    //                                         ),
    //                                   ),
    //                                 ),
    //                               )
    //                             ],
    //                           )
    //                         ],
    //                       ),
    //                     ),
    //                     Expanded(
    //                       child: Container(
    //                         alignment: Alignment.center,
    //                         // color: Colors.red,
    //                         child: Center(
    //                           child: Text(
    //                             'Complete',
    //                             style: TextStyle(
    //                               color: Colors.white,
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                     Expanded(
    //                       child: Row(
    //                         // mainAxisAlignment: MainAxisAlignment.start,
    //                         children: [
    //                           Column(
    //                             crossAxisAlignment: CrossAxisAlignment.start,
    //                             children: [
    //                               Text(
    //                                 'AUS',
    //                                 style: Theme.of(context)
    //                                     .textTheme
    //                                     .bodyMedium!
    //                                     .copyWith(color: Color(0xffCCE2FF)),
    //                               ),
    //                               SizedBox(
    //                                 height: mediaQuery.height * 0.01,
    //                               ),
    //                               SizedBox(
    //                                 width: mediaQuery.width * 0.15,
    //                                 child: FittedBox(
    //                                   child: Text(
    //                                     '000(00.0)',
    //                                     style: Theme.of(context)
    //                                         .textTheme
    //                                         .bodyMedium!
    //                                         .copyWith(
    //                                           fontSize: 18,
    //                                           color: Colors.white,
    //                                         ),
    //                                   ),
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                           SizedBox(
    //                             width: mediaQuery.width * 0.025,
    //                           ),
    //                           CircleAvatar(
    //                             radius: 20,
    //                             backgroundImage:
    //                                 AssetImage('assets/images/au.png'),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: mediaQuery.height * 0.010,
    //               ),
    //               Divider(
    //                 color: Color(0xffE4E5E7),
    //               ),
    //               SizedBox(
    //                 height: mediaQuery.height * 0.010,
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
    //                 child: Row(
    //                   //mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Expanded(
    //                       child: Column(
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           Text(
    //                             'India Won',
    //                             style: Theme.of(context)
    //                                 .textTheme
    //                                 .bodyLarge!
    //                                 .copyWith(
    //                                   fontSize: 16,
    //                                   color: Colors.white,
    //                                 ),
    //                           ),
    //                           SizedBox(
    //                             height: mediaQuery.height * 0.010,
    //                           ),
    //                           Text(
    //                             'By 107 Runs',
    //                             style: Theme.of(context)
    //                                 .textTheme
    //                                 .bodyMedium!
    //                                 .copyWith(
    //                                   fontSize: 16,
    //                                   color: Color(0xffA4AAB1),
    //                                 ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                     Expanded(
    //                       child: Column(
    //                         crossAxisAlignment: CrossAxisAlignment.end,
    //                         children: [
    //                           Text(
    //                             'Last 6 Ball',
    //                             style: Theme.of(context)
    //                                 .textTheme
    //                                 .bodyLarge!
    //                                 .copyWith(
    //                                   fontSize: 16,
    //                                   color: Colors.white,
    //                                 ),
    //                           ),
    //                           SizedBox(
    //                             height: mediaQuery.height * 0.010,
    //                           ),
    //                           Row(
    //                             mainAxisAlignment: MainAxisAlignment.end,
    //                             children: [
    //                               CircleAvatar(
    //                                 radius: 10,
    //                                 backgroundColor: Colors.white,
    //                                 child: CircleAvatar(
    //                                   child: Padding(
    //                                     padding: const EdgeInsets.symmetric(
    //                                       vertical: 2,
    //                                     ),
    //                                     child: Text(
    //                                       '1',
    //                                       style: TextStyle(
    //                                           color: Colors.white,
    //                                           fontSize: 10),
    //                                     ),
    //                                   ),
    //                                   backgroundColor:
    //                                       Theme.of(context).colorScheme.primary,
    //                                   radius: 9,
    //                                 ),
    //                               ),
    //                               SizedBox(width: mediaQuery.width * 0.02),
    //                               CircleAvatar(
    //                                 radius: 10,
    //                                 backgroundColor: Colors.white,
    //                                 child: CircleAvatar(
    //                                   backgroundColor: Color(0xffF5F9FF),
    //                                   radius: 9,
    //                                   child: Text(
    //                                     '4',
    //                                     style: TextStyle(
    //                                         color: Colors.black, fontSize: 10),
    //                                   ),
    //                                 ),
    //                               ),
    //                               SizedBox(width: mediaQuery.width * 0.02),
    //                               CircleAvatar(
    //                                 radius: 10,
    //                                 backgroundColor: Colors.white,
    //                                 child: CircleAvatar(
    //                                   backgroundColor: Color(0xff2A2A2A),
    //                                   radius: 9,
    //                                   child: Text(
    //                                     'WK',
    //                                     style: TextStyle(
    //                                         color: Colors.white, fontSize: 10),
    //                                   ),
    //                                 ),
    //                               ),
    //                               SizedBox(width: mediaQuery.width * 0.02),
    //                               CircleAvatar(
    //                                 radius: 10,
    //                                 backgroundColor: Colors.white,
    //                                 child: CircleAvatar(
    //                                   backgroundColor: Color(0xffF5F9FF),
    //                                   radius: 9,
    //                                   child: Text(
    //                                     '6',
    //                                     style: TextStyle(
    //                                         color: Colors.black, fontSize: 10),
    //                                   ),
    //                                 ),
    //                               ),
    //                               SizedBox(width: mediaQuery.width * 0.02),
    //                               CircleAvatar(
    //                                 radius: 10,
    //                                 backgroundColor: Colors.white,
    //                                 child: CircleAvatar(
    //                                   child: Padding(
    //                                     padding: const EdgeInsets.symmetric(
    //                                       vertical: 2,
    //                                     ),
    //                                     child: Text(
    //                                       'LB',
    //                                       style: TextStyle(
    //                                           color: Colors.white,
    //                                           fontSize: 10),
    //                                     ),
    //                                   ),
    //                                   backgroundColor:
    //                                       Theme.of(context).colorScheme.primary,
    //                                   radius: 9,
    //                                 ),
    //                               ),
    //                               SizedBox(width: mediaQuery.width * 0.02),
    //                               CircleAvatar(
    //                                 radius: 10,
    //                                 backgroundColor: Colors.white,
    //                                 child: CircleAvatar(
    //                                   backgroundColor:
    //                                       Theme.of(context).colorScheme.primary,
    //                                   radius: 9,
    //                                 ),
    //                               )
    //                             ],
    //                           )
    //                         ],
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               )
    //             ],
    //           ),
    //           decoration: BoxDecoration(
    //               color: Theme.of(context).colorScheme.primary,
    //               borderRadius: const BorderRadius.only(
    //                 bottomLeft: Radius.circular(10.0),
    //                 bottomRight: Radius.circular(10.0),
    //               )),
    //           height: mediaQuery.height * 0.32,
    //           padding:
    //               EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.008),
    //         ),
    //         TabBar(
    //           indicatorColor: Theme.of(context).colorScheme.primary,
    //           tabs: [
    //             Tab(
    //               child: Text(
    //                 'Summary',
    //                 style:
    //                     TextStyle(color: Theme.of(context).colorScheme.primary),
    //               ),
    //             ),
    //             Tab(
    //               //text: 'Summary',
    //               child: Text(
    //                 'ScoreCard',
    //                 style:
    //                     TextStyle(color: Theme.of(context).colorScheme.primary),
    //               ),
    //             )
    //           ],
    //         ),
    //         Expanded(
    //             child: TabBarView(
    //           children: [
    //             ScoreSummaryScreen(id: id),
    //             ScoreCardScreen(),
    //           ],
    //         ))
    //       ],
    //     ),
    //   ),
    // );
  }
}
