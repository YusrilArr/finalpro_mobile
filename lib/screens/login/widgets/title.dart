// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class wTitle extends StatefulWidget {
  const wTitle({
    super.key,
  });

  @override
  State<wTitle> createState() => _wTitleState();
}

class _wTitleState extends State<wTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'Dompet Saya',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Sign In to your account',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
