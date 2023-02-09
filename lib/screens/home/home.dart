// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:finalpro_mobile/screens/home/widgets/btn-main-menu.dart';
import 'package:finalpro_mobile/screens/home/widgets/sponsor.dart';
import 'package:finalpro_mobile/screens/home/widgets/top_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopWidget(),
              // DosaMoneyAndPoints(),
              // ButtonTopUp(),

              SizedBox(
                height: 20,
              ),
              Container(
                // color: Colors.yellow,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.amber,
                          blurRadius: 3,
                          offset: Offset(3, 3)),
                    ],
                    gradient: LinearGradient(
                      colors: [
                        Colors.red,
                        Colors.orange,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(25)),
                padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: ButtonMainMenu(),
              ),
              SizedBox(
                height: 20.0,
              ),
              Divider(
                color: Color.fromARGB(255, 195, 190, 190),
                thickness: 10,
              ),
              SizedBox(height: 10),

              ItemSponsor(
                imgSponsor: 'images/kfc.jpg',
                sponsorBy: 'KFC',
                titleSponsor: 'Ayam Geratis',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
