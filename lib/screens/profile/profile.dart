// ignore_for_file: prefer_const_constructors

import 'package:finalpro_mobile/controller/auth_controller.dart';
import 'package:finalpro_mobile/screens/profile/widgets/profileinfo.dart';
import 'package:finalpro_mobile/screens/profile/widgets/profilsettinglist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 120,
          shadowColor: Colors.transparent,
          backgroundColor: Color.fromARGB(255, 232, 224, 224),
          flexibleSpace: ProfileInfo(),
        ),
        body: ProfileSettingList(),
      ),
    );
  }
}
//  ElevatedButton(
//                 onPressed: () => authC.logout(context),
//                 child: Text('Logout'),
//               )
