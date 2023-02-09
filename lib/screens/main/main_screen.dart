// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:finalpro_mobile/screens/history/history.dart';
import 'package:finalpro_mobile/screens/home/home.dart';
import 'package:finalpro_mobile/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: TabBarView(
            children: [
              HomePage(),
              HistoryPage(),
              ProfilePage(),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 2,
                spreadRadius: 0,
              )
            ],
            color: Color.fromARGB(255, 224, 223, 217),
          ),
          child: TabBar(
              indicator: BoxDecoration(
                  color: Color.fromARGB(255, 150, 146, 144),
                  borderRadius: BorderRadius.circular(60)),
              indicatorSize: TabBarIndicatorSize.values.first,
              labelColor: Color.fromARGB(255, 27, 4, 234),
              indicatorColor: Colors.transparent,
              labelPadding: EdgeInsets.all(0.5),
              indicatorWeight: 1,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
              unselectedLabelColor: Colors.black45,
              tabs: [
                Tab(
                  icon: Image.asset(
                    'icons/home.png',
                    height: 40,
                  ),
                ),
                Tab(
                  icon: Image.asset(
                    'icons/open-book.png',
                    height: 40,
                  ),
                ),
                Tab(
                    icon: Image.asset(
                  'icons/man.png',
                  height: 40,
                )),
              ]),
        ),
      ),
    );
  }
}
