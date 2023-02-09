import 'package:flutter/material.dart';

const List list = [
  'BRI',
  'BCA',
  'MANDIRI',
  'CIMB NIAGA',
  'GANESHA',
];

class BtnTopUp extends StatefulWidget {
  const BtnTopUp({super.key});

  @override
  State<BtnTopUp> createState() => _BtnTopUpState();
}

class _BtnTopUpState extends State<BtnTopUp> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      elevation: 16,
      style: TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.grey,
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>(
        (value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        },
      ).toList(),
    );
  }
}
