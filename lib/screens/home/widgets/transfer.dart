// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatefulWidget {
  TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

User? user1 = FirebaseAuth.instance.currentUser;
User? user = FirebaseAuth.instance.currentUser;

class _TransferPageState extends State<TransferPage> {
  @override
  Widget build(BuildContext context) {
    final balance = TextEditingController();
    final ket = TextEditingController();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');

    return Scaffold(
      appBar: AppBar(
          // automaticallyImplyLeading: false,
          title: Text('Siapa yang ingin anda transfer?')),
      body: SafeArea(
        maintainBottomViewPadding: false,
        child: Container(
          padding: EdgeInsets.all(25),
          child: StreamBuilder<QuerySnapshot>(
            stream: users.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  //     maxCrossAxisExtent: 320,
                  //     mainAxisExtent: 80,
                  //     childAspectRatio: 3 / 2,
                  //     crossAxisSpacing: 10,
                  //     mainAxisSpacing: 20),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data!.docs[index];

                    if (data.id == user!.uid) {
                      return Container();
                    }
                    return Container(
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                actions: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      setState(
                                        () {
                                          users.doc(data.id).update({
                                            "balance": FieldValue.increment(
                                                int.parse(balance.text)),
                                          });
                                          users.doc(user!.uid).update({
                                            "balance": FieldValue.increment(
                                                -int.parse(balance.text)),
                                          });
                                          users
                                              .doc(user!.uid)
                                              .collection('History')
                                              .add(
                                            {
                                              "id": user!.uid,
                                              "nama": data['name'],
                                              "jenis": "TRANSFER",
                                              "keterangan": ket.text,
                                              "cash_out": balance.text,
                                              "tanggal": DateTime.now()
                                            },
                                          );
                                        },
                                      );
                                    },
                                    child: Icon(Icons.send_sharp),
                                  ),
                                ],
                                icon: Icon(Icons.attach_money_outlined),
                                scrollable: true,
                                title: Column(
                                  children: [
                                    Center(child: Text('transfer ke')),
                                    Text(data['name']),
                                  ],
                                ),
                                content: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Form(
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          controller: balance,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 3,
                                                color: Color.fromARGB(
                                                    255, 195, 227, 242),
                                              ),
                                            ),
                                            labelText: 'jumlah uang',
                                            icon: Icon(
                                              Icons.money_off_csred_outlined,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          controller: ket,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 3,
                                                color: Color.fromARGB(
                                                    255, 195, 227, 242),
                                              ),
                                            ),
                                            labelText: 'Catatan',
                                            icon: Icon(Icons.description),
                                          ),
                                          // controller: qtyconts,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            // decoration: BoxDecoration(
                            //   image: DecorationImage(
                            //       image: AssetImage("icons/medal.png"),
                            //       scale: 1.0,
                            //       fit: BoxFit.cover),
                            //   borderRadius: BorderRadius.circular(16),
                            // ),
                            child: ListTile(
                              title: Image.asset(
                                'icons/man.png',
                                height: 50,
                              ),
                              subtitle: Column(
                                children: [
                                  Text(
                                    data['name'].toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  // Text(DateTime.now().toString()),
                                  // Text(data['balance'].toString())
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Text("loading");
              }
            },
          ),
        ),
      ),
    );
  }
}
