// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class ButtonMainMenu extends StatefulWidget {
  const ButtonMainMenu({super.key});

  @override
  State<ButtonMainMenu> createState() => _ButtonMainMenuState();
}

class _ButtonMainMenuState extends State<ButtonMainMenu> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: [
          MenuIcon(
            title: 'Paket Data',
            imageAsset: 'icons/wifi.png',
          ),
          MenuIcon(
            title: 'Listrik',
            imageAsset: 'icons/bolt.png',
          ),
          MenuIcon(
            title: 'Pulsa',
            imageAsset: 'icons/sim-card.png',
          ),
          MenuIcon(
            title: 'TV Kabel',
            imageAsset: 'icons/tv.png',
          ),
          MenuIcon(
            title: 'Voucher Game',
            imageAsset: 'icons/joystick.png',
          ),
          MenuIcon(
            title: 'BPJS',
            imageAsset: 'icons/first-aid-kit.png',
          ),
          MenuIcon(
            title: 'PDAM',
            imageAsset: 'icons/water2.png',
          ),
          MenuIcon(
            title: 'Lihat Semua',
            imageAsset: 'icons/widget.png',
          ),
        ],
      ),
    );
  }
}

class MenuIcon extends StatelessWidget {
  final String title;
  final String imageAsset;

  const MenuIcon({
    Key? key,
    required this.title,
    required this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            print(title);
          },
          icon: Image.asset(imageAsset),
          iconSize: 50,
        ),
        Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
