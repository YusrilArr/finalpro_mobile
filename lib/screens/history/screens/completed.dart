// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, body_might_complete_normally_nullable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalpro_mobile/screens/home/widgets/top_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:intl/intl.dart';

class CompletedHistory extends StatelessWidget {
  CompletedHistory({super.key});

  User? history = FirebaseAuth.instance.currentUser;

  // User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference history =
        firestore.collection('users/${user!.uid}/History');
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 35, 0, 10),
            // ignore: prefer_const_constructors
            child: Text(
              'Recent',
              // ignore: prefer_const_constructors
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Flexible(
            child: ActivityItems(),
            //     StreamBuilder<QuerySnapshot>(
            //   stream: history.snapshots(),
            //   builder: (context, snapshot) {
            //     if (!snapshot.hasData) {
            //       return Text('Data Tidak Ditemukan.');
            //     }
            //     if (snapshot.hasData) {
            //       return Container(
            //         height: MediaQuery.of(context).size.height,
            //         child: ListView.builder(
            //           itemCount: snapshot.data!.docs.length,
            //           itemBuilder: (context, index) {
            //             DocumentSnapshot data = snapshot.data!.docs[index];

            //             return GestureDetector(
            //               onTap: () {
            //                 showDialog(
            //                   context: context,
            //                   builder: (BuildContext context) {
            //                     return AlertDialog(
            //                       elevation: 0,
            //                       buttonPadding: EdgeInsets.all(12),
            //                       actions: [
            //                         ElevatedButton(
            //                           onPressed: () {
            //                             Navigator.pop(context);
            //                           },
            //                           child: Text('Close'),
            //                         ),
            //                       ],
            //                       scrollable: true,
            //                       title: Column(
            //                         crossAxisAlignment: CrossAxisAlignment.start,
            //                         children: [
            //                           Positioned(
            //                             child: Text('Detail',
            //                                 style: TextStyle(
            //                                     color: Colors.purple.shade400)),
            //                           ),
            //                           SizedBox(
            //                             height: 10,
            //                           ),
            //                           Text("nama : " + data['name']),
            //                           SizedBox(
            //                             height: 10,
            //                           ),
            //                           Text("ID : " + data.id,
            //                               style: TextStyle(fontSize: 15)),
            //                           SizedBox(
            //                             height: 10,
            //                           ),
            //                           Row(
            //                             children: [
            //                               Text('Status : '),
            //                               Text(
            //                                 'Berhasil!',
            //                                 style: TextStyle(color: Colors.green),
            //                               ),
            //                             ],
            //                           ),
            //                         ],
            //                       ),
            //                       content: Padding(
            //                         padding: EdgeInsets.all(8.0),
            //                         child: Container(
            //                           padding: EdgeInsets.all(5),
            //                           decoration: BoxDecoration(
            //                             borderRadius: BorderRadius.circular(16),
            //                             color: Colors.white54,
            //                           ),
            //                           child: Row(
            //                             mainAxisAlignment:
            //                                 MainAxisAlignment.spaceBetween,
            //                             children: [
            //                               Image.asset(
            //                                 'icons/man.png',
            //                                 height: 30,
            //                               ),
            //                               SizedBox(
            //                                 height: 20,
            //                               ),
            //                               Column(
            //                                 mainAxisAlignment:
            //                                     MainAxisAlignment.center,
            //                                 children: [
            //                                   Text(
            //                                     data['name'],
            //                                     style: TextStyle(
            //                                         fontSize: 15,
            //                                         color:
            //                                             Colors.purple.shade600),
            //                                   ),
            //                                   SizedBox(
            //                                     height: 10,
            //                                   ),
            //                                   Text(
            //                                     data.id,
            //                                     style: TextStyle(
            //                                         fontSize: 8,
            //                                         color:
            //                                             Colors.purple.shade600),
            //                                   ),
            //                                 ],
            //                               ),
            //                               Column(
            //                                 children: [
            //                                   Text(
            //                                     "-" + data['cash_out'].toString(),
            //                                     style: TextStyle(
            //                                         fontSize: 20,
            //                                         color:
            //                                             Colors.purple.shade500),
            //                                   ),
            //                                   Text(
            //                                     data['keterangan'],
            //                                     style: TextStyle(
            //                                         fontSize: 10,
            //                                         color:
            //                                             Colors.purple.shade500),
            //                                   ),
            //                                 ],
            //                               )
            //                             ],
            //                           ),
            //                         ),
            //                       ),
            //                     );
            //                   },
            //                 );
            //               },
            //             );
            //           },
            //         ),
            //       );
            //     } else {
            //       return Text('Data Tidak ditemukan.');
            //     }
            //   },
            // )
          ),
        ],
      ),
    );
  }
}

class ActivityItems extends StatelessWidget {
  ActivityItems({
    Key? key,
  }) : super(key: key);
  User? history = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference history =
        firestore.collection('users/${user!.uid}/History');
    return StreamBuilder<QuerySnapshot>(
        stream: history.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('Data tidak ditemukan.');
          }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot data = snapshot.data!.docs[index];

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Container(
                    // height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // color: Color.fromARGB(255, 243, 82, 33),
                      gradient: LinearGradient(
                        colors: [
                          Colors.red,
                          Colors.amber,
                          Colors.orange,
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              'icons/man.png',
                              height: 50,
                            ),
                            Positioned(
                              bottom: 0,
                              left: 27,
                              child: Container(
                                padding: EdgeInsets.all(0.3),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            ),
                          ],
                        ),

                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data['jenis'],
                                            style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              data['jenis'] == "TOP UP"
                                                  ? Text(
                                                      "Top Up dari Bank " +
                                                          data['nama'],
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16),
                                                    )
                                                  : Text(
                                                      "Transfer ke " +
                                                          data['nama'],
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16),
                                                    )
                                            ],
                                          ),
                                          Text(
                                            DateFormat.yMMMMEEEEd().format(
                                                (data['tanggal'] as Timestamp)
                                                    .toDate()),
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            DateFormat('Hms').format(
                                                (data['tanggal'] as Timestamp)
                                                    .toDate()),
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          data['jenis'] == "TOP UP"
                                              ? Text(
                                                  "+ Rp." + data['cash_out'],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                )
                                              : Text(
                                                  "- Rp." + data['cash_out'],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          print('retransfer');
                                        },
                                        child: Text(
                                          'Re-Transfer',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            print('detail transfer');
                                          },
                                          child: Text(
                                            'Detail',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 15,
                                            ),
                                          ))
                                    ],
                                  ),
                                  onTap: () {
                                    print('Detail');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Text('Well Done'),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Text('data kosong');
          }
        });
  }
}
