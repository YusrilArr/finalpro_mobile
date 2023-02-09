import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ButtonTransfer extends StatefulWidget {
  const ButtonTransfer({super.key});

  @override
  State<ButtonTransfer> createState() => _ButtonTransferState();
}

class _ButtonTransferState extends State<ButtonTransfer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Transfer');
      },
      child: Container(
        width: double.infinity,
        height: 45,
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3,
              spreadRadius: 0.5,
            ),
          ],
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              //Stack Icon
              Stack(
                children: [
                  Image.asset(
                    'icons/transfer.png',
                    width: 23,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      padding: EdgeInsets.all(0.3),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      // child: Icon(
                      //   LineAwesomeIcons.plus,
                      //   color: Colors.white,
                      //   size: 8,
                      // ),
                    ),
                  ),
                ],
              ),
              Text(
                ' Transfer',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
