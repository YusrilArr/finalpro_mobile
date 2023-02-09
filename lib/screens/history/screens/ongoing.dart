import 'package:flutter/material.dart';

class OnGoingHistory extends StatefulWidget {
  const OnGoingHistory({super.key});

  @override
  State<OnGoingHistory> createState() => _OnGoingHistoryState();
}

class _OnGoingHistoryState extends State<OnGoingHistory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 100),
      child: Center(
        child: Column(
          children: [
            Image.asset(
              'icons/cancel.png',
              height: 150,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'You have completed all transactions.',
              style: TextStyle(
                fontSize: 13,
                fontStyle: FontStyle.italic,
              ),
            )
          ],
        ),
      ),
    );
  }
}


// Center(
//       child: Text('you have completed all transactions'),
//     );