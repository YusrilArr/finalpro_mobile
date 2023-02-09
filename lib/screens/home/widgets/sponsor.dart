// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ItemSponsor extends StatefulWidget {
  final String imgSponsor;
  final String titleSponsor;
  final String sponsorBy;
  const ItemSponsor(
      {super.key,
      required this.imgSponsor,
      required this.titleSponsor,
      required this.sponsorBy});

  @override
  State<ItemSponsor> createState() => _ItemSponsorState();
}

class _ItemSponsorState extends State<ItemSponsor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              widget.imgSponsor,
              width: double.infinity,
              height: 150,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              widget.titleSponsor,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Center(
            child: Text(
              'Sponsored by ${widget.sponsorBy}',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.black38,
              ),
            ),
          )
        ],
      ),
    );
  }
}
