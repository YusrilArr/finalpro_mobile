// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_single_cascade_in_expression_statements

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalpro_mobile/screens/home/widgets/btn-topup.dart';
import 'package:finalpro_mobile/screens/home/widgets/transfer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:dropdown_search/dropdown_search.dart';

class TopWidget extends StatefulWidget {
  const TopWidget({super.key});

  @override
  State<TopWidget> createState() => _TopWidgetState();
}

User? user = FirebaseAuth.instance.currentUser;

final item = [
  "BRI",
  "BNI",
  "BCA",
  "MANDIRI",
  "CIMB NIAGA",
];

class _TopWidgetState extends State<TopWidget> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final balance = TextEditingController();
    final ket = TextEditingController();
    String nama = "";
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    return Container(
        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                ClipPath(
                  clipper: ClipPathClass(),
                  child: Container(
                    height: 250,
                    width: Get.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.yellow,
                          Colors.red,
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('Hallo, '),
                          StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('users')
                                .doc(user!.uid)
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data!['name'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                );
                              } else {
                                return Text('Loading');
                              }
                            },
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          print('QRIS');
                        },
                        child: Image.asset(
                          'icons/qr.png',
                          height: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      ClipPath(
                        clipper: ClipInfoClass(),
                        child: Container(
                          padding: EdgeInsets.all(15),
                          margin: EdgeInsets.symmetric(horizontal: 25),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Colors.red,
                                Colors.yellow,
                              ],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Sisa Saldo Anda",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Image.asset(
                                    "icons/man.png",
                                    height: 100,
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  StreamBuilder<DocumentSnapshot>(
                                    stream: FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(user!.uid)
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return RichText(
                                          text: TextSpan(
                                            children: [
                                              WidgetSpan(
                                                child: Transform.translate(
                                                  offset: const Offset(0, -15),
                                                  child: Text(
                                                    'Rp',
                                                    textScaleFactor:
                                                        1, //memperkecil ukuran, semakin besar parmater, '1' berarti ukuran -50% dari default fontsize
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              TextSpan(
                                                text: snapshot.data!['balance']
                                                    .toString(),
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 30,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      } else {
                                        return Text('Loading. . .');
                                      }
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(
                                          color: Colors.orange,
                                          offset: Offset(3, 5))
                                    ], borderRadius: BorderRadius.circular(5)),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              backgroundColor: Color.fromARGB(
                                                  255, 228, 225, 223),
                                              title: Text('Top Up'),
                                              content: Form(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    DropdownSearch<String>(
                                                      popupProps:
                                                          PopupProps.dialog(
                                                        showSelectedItems: true,
                                                      ),
                                                      items: item,
                                                      dropdownDecoratorProps:
                                                          DropDownDecoratorProps(
                                                        dropdownSearchDecoration: InputDecoration(
                                                            border: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16)),
                                                            labelText:
                                                                'Pilih Mode'),
                                                      ),
                                                      onChanged: (value) {
                                                        nama = value!;
                                                      },
                                                    ),
                                                    TextFormField(
                                                      controller: balance,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            'Masukkan Nominal Top up',
                                                        label: Text('Rp'),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            AwesomeDialog(
                                                              context: context,
                                                              dialogType:
                                                                  DialogType
                                                                      .success,
                                                              animType: AnimType
                                                                  .leftSlide,
                                                              title: 'Success!',
                                                              desc:
                                                                  'Transaksi Berhasil',
                                                              btnOkOnPress: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            )..show();
                                                            setState(() {
                                                              users
                                                                  .doc(
                                                                      user!.uid)
                                                                  .update({
                                                                'balance': FieldValue
                                                                    .increment(int
                                                                        .parse(balance
                                                                            .text))
                                                              });
                                                              users
                                                                  .doc(
                                                                      user!.uid)
                                                                  .collection(
                                                                      'History')
                                                                  .add({
                                                                "id": user!.uid,
                                                                "nama": nama,
                                                                "jenis":
                                                                    "TOP UP",
                                                                "tanggal":
                                                                    DateTime
                                                                        .now(),
                                                                "cash_out":
                                                                    balance
                                                                        .text,
                                                                "keterangan":
                                                                    "topup"
                                                              });
                                                            });
                                                          },
                                                          child: Text('OK'),
                                                        ),
                                                        ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  primary:
                                                                      Colors
                                                                          .red),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text('Cancel'),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Text(
                                        "Top Up",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFFF7B731),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 40),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.red,
                                                offset: Offset(3, 5))
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    TransferPage(),
                                              ));
                                        },
                                        child: Text(
                                          "Transfer",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFFF7B731),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ));
  }
}

class ClipInfoClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width - 80, size.height);
    path.lineTo(size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 60);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 60,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}
    // Stack(
    //   children: [
    //     Image.asset(
    //       'images/bg.png',
    //       fit: BoxFit.fill,
    //       width: double.infinity,
    //       height: 250,
    //     ),
    //     Container(
    //       width: double.infinity,
    //       child: Column(
    //         children: [
    //           SizedBox(
    //             height: 10,
    //           ),
    //           Text(
    //             'Balance',
    //             style: TextStyle(
    //               fontWeight: FontWeight.bold,
    //               fontSize: 25,
    //               color: Colors.white,
    //             ),
    //           ),
    //           SizedBox(
    //             height: 25,
    //           ),
    //           StreamBuilder<DocumentSnapshot>(
    //             stream: FirebaseFirestore.instance
    //                 .collection('users')
    //                 .doc(user!.uid)
    //                 .snapshots(),
    //             builder: (context, snapshot) {
    //               if (snapshot.hasData) {
    //                 return RichText(
    //                   text: TextSpan(
    //                     children: [
    //                       WidgetSpan(
    //                         child: Transform.translate(
    //                           offset: const Offset(0, -15),
    //                           child: Text(
    //                             'Rp',
    //                             textScaleFactor:
    //                                 1, //memperkecil ukuran, semakin besar parmater, '1' berarti ukuran -50% dari default fontsize
    //                             style: TextStyle(
    //                               color: Colors.black,
    //                               fontWeight: FontWeight.bold,
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                       TextSpan(
    //                         text: snapshot.data!['balance'].toString(),
    //                         style: TextStyle(
    //                           color: Colors.black,
    //                           fontWeight: FontWeight.bold,
    //                           fontSize: 30,
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 );
    //               } else {
    //                 return Text('Loading. . .');
    //               }
    //             },
    //           ),
    //           SizedBox(
    //             height: 25,
    //           ),
    //           Row(
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               SizedBox(
    //                 height: 10,
    //               ),
    //               SizedBox(
    //                 height: 5,
    //               ),
    //             ],
    //           ),
    //           SizedBox(
    //             height: 3,
    //           ),
    //           Container(
    //             margin: EdgeInsets.symmetric(horizontal: 20),
    //             padding: EdgeInsets.only(top: 20, bottom: 20),
    //             decoration: BoxDecoration(
    //               gradient: RadialGradient(
    //                 colors: [
    //                   Colors.red,
    //                   Colors.orange,
    //                 ],
    //                 radius: 1,
    //               ),
    //               borderRadius: BorderRadius.circular(30),
    //               boxShadow: [
    //                 BoxShadow(
    //                   color: Colors.black38,
    //                   blurRadius: 1,
    //                   spreadRadius: 0.5,
    //                 ),
    //               ],
    //             ),
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Column(
    //                   children: [
    //                     InkWell(
    //                       onTap: () {
    //                         showDialog(
    //                           context: context,
    //                           builder: (context) {
    //                             return AlertDialog(
    //                               backgroundColor:
    //                                   Color.fromARGB(255, 226, 255, 59),
    //                               title: Text('Top Up'),
    //                               content: Form(
    //                                 child: Column(
    //                                   mainAxisSize: MainAxisSize.min,
    //                                   children: [
    //                                     DropdownSearch<String>(
    //                                       popupProps: PopupProps.dialog(
    //                                         showSelectedItems: true,
    //                                       ),
    //                                       items: item,
    //                                       dropdownDecoratorProps:
    //                                           DropDownDecoratorProps(
    //                                         dropdownSearchDecoration:
    //                                             InputDecoration(
    //                                                 border: OutlineInputBorder(
    //                                                     borderRadius:
    //                                                         BorderRadius
    //                                                             .circular(16)),
    //                                                 labelText: 'Pilih Mode'),
    //                                       ),
    //                                       onChanged: (value) {
    //                                         nama = value!;
    //                                       },
    //                                     ),
    //                                     TextFormField(
    //                                       controller: balance,
    //                                       decoration: InputDecoration(
    //                                         hintText: 'Masukkan Nominal Top up',
    //                                         label: Text('Rp'),
    //                                       ),
    //                                     ),
    //                                     SizedBox(
    //                                       height: 30,
    //                                     ),
    //                                     Row(
    //                                       mainAxisAlignment:
    //                                           MainAxisAlignment.spaceAround,
    //                                       children: [
    //                                         ElevatedButton(
    //                                           onPressed: () {
    //                                             AwesomeDialog(
    //                                               context: context,
    //                                               dialogType:
    //                                                   DialogType.success,
    //                                               animType: AnimType.leftSlide,
    //                                               title: 'Success!',
    //                                               desc: 'Transaksi Berhasil',
    //                                               btnOkOnPress: () {
    //                                                 Navigator.pop(context);
    //                                               },
    //                                             )..show();
    //                                             setState(() {
    //                                               users.doc(user!.uid).update({
    //                                                 'balance':
    //                                                     FieldValue.increment(
    //                                                         int.parse(
    //                                                             balance.text))
    //                                               });
    //                                               users
    //                                                   .doc(user!.uid)
    //                                                   .collection('History')
    //                                                   .add({
    //                                                 "id": user!.uid,
    //                                                 "nama": nama,
    //                                                 "jenis": "TOP UP",
    //                                                 "tanggal": DateTime.now(),
    //                                                 "cash_out": balance.text,
    //                                                 "keterangan": "topup"
    //                                               });
    //                                             });
    //                                           },
    //                                           child: Text('OK'),
    //                                         ),
    //                                         ElevatedButton(
    //                                           style: ElevatedButton.styleFrom(
    //                                               primary: Colors.red),
    //                                           onPressed: () {
    //                                             Navigator.pop(context);
    //                                           },
    //                                           child: Text('Cancel'),
    //                                         ),
    //                                       ],
    //                                     )
    //                                   ],
    //                                 ),
    //                               ),
    //                             );
    //                           },
    //                         );
    //                       },
    //                       child: Image.asset(
    //                         'icons/top-up.png',
    //                         height: 60,
    //                       ),
    //                     ),
    //                     Text(
    //                       'Top Up',
    //                       style: TextStyle(fontWeight: FontWeight.bold),
    //                     )
    //                   ],
    //                 ),
    //                 SizedBox(
    //                   width: 100,
    //                 ),
    //                 Column(
    //                   children: [
    //                     InkWell(
    //                       onTap: () {
    //                         Navigator.push(
    //                             context,
    //                             MaterialPageRoute(
    //                               builder: (context) => TransferPage(),
    //                             ));
    //                       },
    //                       child: Image.asset(
    //                         'icons/money-transfer.png',
    //                         height: 60,
    //                       ),
    //                     ),
    //                     Text(
    //                       'Transfer',
    //                       style: TextStyle(fontWeight: FontWeight.bold),
    //                     )
    //                   ],
    //                 ),
    //                 // TopUpBtn(),
    //                 // MenuItem(),
    //               ],
    //             ),
    //           )
    //         ],
    //       ),
    //     )
    //   ],
    // );