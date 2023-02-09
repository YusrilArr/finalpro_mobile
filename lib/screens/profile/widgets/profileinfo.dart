// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileInfo extends StatelessWidget {
  ProfileInfo({super.key});
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.red,
        Colors.orange,
        Colors.amber,
      ])),
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('icons/man.png'),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(user!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      snapshot.data!['name'].toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        print('Edit Profile');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Edit Profile',
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            LineAwesomeIcons.angle_right,
                            size: 12,
                          ),
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return Text('Loading . . .');
              }
            },
          ),
        ],
      ),
    );
  }
}

// Container(
//             padding: EdgeInsets.symmetric(
//               vertical: 10,
//               horizontal: 5,
//             ),
//             child: Row(
//               children: [
//                 Container(
//                   width: 100,
//                   height: 100,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     image: DecorationImage(
//                       image: AssetImage('icons/man.png'),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Column(
//                   mainAxisSize:
//                       MainAxisSize.min, //meluruskan nama dengan profil
//                   crossAxisAlignment:
//                       CrossAxisAlignment.start, //meluruskan nama dengan profil
//                   children: [
//                     Text(
//                       'Muhamad Yusril',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     InkWell(
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(
//                             'Edit Profile',
//                             style: TextStyle(
//                               color: Colors.black54,
//                             ),
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Icon(
//                             LineAwesomeIcons.angle_right,
//                             size: 12,
//                           ),
//                         ],
//                       ),
//                       onTap: () {
//                         print('Edit Profile');
//                       },
//                     )
//                   ],
//                 )
//               ],
//             ),
//           );
