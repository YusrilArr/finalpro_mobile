// import 'package:provider/provider.dart';
// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:js';

import 'package:finalpro_mobile/screens/login/forgot_password.dart';
import 'package:finalpro_mobile/screens/login/login.dart';
import 'package:finalpro_mobile/screens/main/main_screen.dart';
import 'package:finalpro_mobile/screens/register/verif_email.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  //Login with email and password
  void loginWithEmail(
      {required BuildContext context,
      required String email,
      required String password}) async {
    if (email == 'tes@gmail.com' && password == 'password') {
      await Future.delayed(Duration(seconds: 2));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(),
        ),
      );
    } else {
      print('Login Gagal');
    }
  }

  void resetPassword(
      {required BuildContext context, required String emailForgot}) async {
    if (emailForgot.isNotEmpty) {
      print('Berhasil');
      await Future.delayed(Duration(seconds: 1));
      wShowToast(
          'Email sended! Please check your email to reset your password');
      Navigator.pop(context);
    } else {
      print('Gagal');
    }
  }

  void registerWithEmail({
    required BuildContext context,
    required String name,
    required String address,
    required String phone,
    required String password,
    required String rePassword,
  }) async {
    print('name');
    print('address');
    print('phone');
    print('password');
    print('rePassword');

    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ));

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return VerifEmail();
      },
    );
  }

  Future<void> resendEmailVerif() async {
    await Future.delayed(Duration(seconds: 2));
  }
}
