import 'package:finalpro_mobile/routes/route_name.dart';
import 'package:finalpro_mobile/screens/login/login.dart';
import 'package:finalpro_mobile/screens/main/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  // Stream<User?> streamAuthStatus() {
  //   return auth.authStateChanges();
  // }

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void login(String email, String password, BuildContext context) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(),
          ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No User found for that email!');
      } else if (e.code == 'wrong-password') {
        print('Wrong Password');
      }
    }
  }

  // Future<void>signUp(String name, String email, String phone, String address, String password, String balanace)async{
  //   try{
  //     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

  //     String Uid = userCredential.user!.uid;

  //     await firestore.collection('user').doc(Uid).set({
  //       'name'
  //     })

  //   }
  // }

  Future<UserCredential> signUp(String email, String password) async {
    var credential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    return credential;
  }

  void logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ));
  }
}
