// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:finalpro_mobile/screens/history/widgets/header.dart';
import 'package:finalpro_mobile/screens/history/widgets/tab_bar_history.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            SizedBox(
              height: 20,
            ),
            TabBarHistory(),
          ],
        ),
      )),
    );
  }
}
