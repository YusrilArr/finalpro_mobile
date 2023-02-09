// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class DosaMoneyAndPoints extends StatefulWidget {
  const DosaMoneyAndPoints({
    super.key,
  });

  @override
  State<DosaMoneyAndPoints> createState() => _DosaMoneyAndPointsState();
}

class _DosaMoneyAndPointsState extends State<DosaMoneyAndPoints> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: InkWell(
          onTap: () {
            print('DoSa Money');
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Color(0xFFEBEBEB),
                width: 3,
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.black12,
                      width: 3,
                    ),
                  ),
                  child: Image.asset(
                    'icons/rupiah.png',
                    width: 30,
                    height: 30,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Transform.translate(
                          offset: Offset(2, -4),
                          child: Text(
                            'Rp. ',
                            textScaleFactor: 0.7,
                            style: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TextSpan(
                        text: '55.000',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  LineAwesomeIcons.angle_right,
                  size: 16,
                  color: Colors.black26,
                )
              ],
            ),
          ),
        )),

        //DoSa Transfer
        Expanded(
            child: InkWell(
          onTap: () {
            print('Transfer');
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.symmetric(
                horizontal: BorderSide(
                  color: Color(0xFFEBEBEB),
                  width: 3,
                ),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  child: Image.asset(
                    'icons/transfer.png',
                    width: 25,
                    height: 25,
                  ),
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.black12,
                        width: 3,
                      )),
                ),

                //POINTS
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Transfer',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ]),
                ),
                Icon(
                  LineAwesomeIcons.angle_right,
                  size: 16,
                  color: Colors.black26,
                )
              ],
            ),
          ),
        ))
      ],
    );
  }
}
