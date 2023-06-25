import 'package:flutter/material.dart';

class MatchCard extends StatelessWidget {
  final date;
  final id;

  MatchCard({required this.date, required this.id});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: EdgeInsets.all(12),
      color: Colors.white,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/in.png'),
                  maxRadius: 25,
                  minRadius: 20,
                ),
                SizedBox(
                  height: mediaQuery.height * 0.02,
                ),
                Text(
                  'IND',
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            ),
            Column(
              children: [
                Text(
                  'PAYTM T20',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(
                  height: mediaQuery.height * 0.02,
                ),
                CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Text(
                    'V/S',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.white),
                  ),
                  maxRadius: 15,
                  minRadius: 15,
                ),
                SizedBox(
                  height: mediaQuery.height * 0.02,
                ),
                Text(
                  date,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Color(0xffD94231)),
                )
              ],
            ),
            Column(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/au.png'),
                  maxRadius: 25,
                  minRadius: 20,
                ),
                SizedBox(
                  height: mediaQuery.height * 0.02,
                ),
                Text(
                  'AUS',
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
