// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:finalpro_mobile/screens/history/screens/completed.dart';
import 'package:finalpro_mobile/screens/history/screens/ongoing.dart';
import 'package:flutter/material.dart';

class TabBarHistory extends StatefulWidget {
  const TabBarHistory({super.key});

  @override
  State<TabBarHistory> createState() => _TabBarHistoryState();
}

class _TabBarHistoryState extends State<TabBarHistory>
    with SingleTickerProviderStateMixin {
  int tabIndex = 0;

  TabController? _tabController;

  BoxDecoration setBgTab(int currentIndex) {
    if (tabIndex == currentIndex) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Color(
          0xFFF2F2F2,
        ),
      );
    } else {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Color(0xFFF2F2F2),
      );
    }
  }

  TextStyle setColorText(int currentIndex) {
    if (tabIndex == currentIndex) {
      return TextStyle(
        color: Color.fromARGB(255, 243, 80, 4),
        fontWeight: FontWeight.bold,
        fontSize: 15,
      );
    } else {
      return TextStyle(
        color: Colors.black54,
      );
    }
  }

  // @override
  // void setState(VoidCallback fn) {
  //   super.setState(fn);
  //   _tabController = TabController(length: 2, vsync: this);
  // }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 15,
            ),
            width: 200,
            height: 36,
            child: TabBar(
              onTap: (index) {
                setState(() {
                  tabIndex = index;
                });
              },
              controller: _tabController,
              labelPadding: EdgeInsets.symmetric(horizontal: 2),
              indicatorColor: Colors.transparent,
              tabs: [
                Tab(
                  child: Container(
                    child: Center(
                      child: Text(
                        'On Going',
                        style: setColorText(0),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 5),
                    decoration: setBgTab(0),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Center(
                      child: Text(
                        'Completed',
                        style: setColorText(1),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    decoration: setBgTab(1),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                OnGoingHistory(),
                CompletedHistory(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
