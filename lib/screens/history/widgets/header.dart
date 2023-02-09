// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 243, 80, 4),
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'History',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          // InkWell(
          //   child: Container(
          //     padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          //     child: Text(
          //       'History',
          //       style: TextStyle(
          //         fontSize: 19,
          //         color: Colors.blue,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          //   onTap: () {
          //     print(
          //       'History',
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
