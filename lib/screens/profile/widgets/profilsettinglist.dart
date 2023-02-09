// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:finalpro_mobile/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'package:flutter_settings_ui/flutter_settings_ui.dart';

class ProfileSettingList extends StatelessWidget {
  const ProfileSettingList({super.key});

  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();
    return SettingsList(
      backgroundColor: Colors.white,
      sections: [
        SettingsSection(
          titlePadding: EdgeInsets.all(30),
          tiles: [
            SettingsTile(
              leading: Image.asset(
                'icons/medal.png',
                height: 30,
              ),
              title: 'Reward Member',
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    LineAwesomeIcons.angle_right,
                    size: 16,
                  ),
                ],
              ),
              onPressed: (context) {
                print('Reward Member');
              },
            ),
            SettingsTile(
              leading: Image.asset(
                'icons/negotiation.png',
                height: 30,
              ),
              title: 'Bussiness Profile',
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    LineAwesomeIcons.angle_right,
                    size: 16,
                  ),
                ],
              ),
              onPressed: (context) {
                print('Bussiness Profile');
              },
            ),
            SettingsTile(
              leading: Image.asset(
                'icons/calendar.png',
                height: 30,
              ),
              title: 'Scheduled',
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    LineAwesomeIcons.angle_right,
                    size: 16,
                  ),
                ],
              ),
              onPressed: (context) {
                print('Scheduled');
              },
            ),
            SettingsTile(
              leading: Image.asset(
                'icons/credit-card.png',
                height: 30,
              ),
              title: 'Cards',
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    LineAwesomeIcons.angle_right,
                    size: 16,
                  ),
                ],
              ),
              onPressed: (context) {
                print('Cards');
              },
            ),
            SettingsTile(
              leading: Image.asset(
                'icons/subscription.png',
                height: 30,
              ),
              title: 'Subscriptions',
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    LineAwesomeIcons.angle_right,
                    size: 16,
                  ),
                ],
              ),
              onPressed: (context) {
                print('Subscriptions');
              },
            ),
            SettingsTile(
              leading: Image.asset(
                'icons/24-hours.png',
                height: 30,
              ),
              title: 'Support The Environment',
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red,
                    ),
                    child: Text(
                      'New',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Icon(
                    LineAwesomeIcons.angle_right,
                    size: 16,
                  ),
                ],
              ),
              onPressed: (context) {
                print('Support The Environment');
              },
            ),
            SettingsTile(
                leading: Image.asset(
                  'icons/logout.png',
                  height: 30,
                ),
                title: 'Log Out',
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      LineAwesomeIcons.angle_right,
                      size: 16,
                    ),
                  ],
                ),
                onPressed: (context) => authC.logout(context)),
          ],
        )
      ],
    );
  }
}
