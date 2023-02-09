import 'package:finalpro_mobile/common/theme_helper.dart';
import 'package:flutter/material.dart';

class BtnLogin extends StatefulWidget {
  const BtnLogin({
    super.key,
  });

  @override
  State<BtnLogin> createState() => _BtnLoginState();
}

class _BtnLoginState extends State<BtnLogin> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ThemeHelper().buttonBoxDecoration(context),
      child: ElevatedButton(
        style: ThemeHelper().buttonStyle(),
        child: Padding(
          padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
          child: Text(
            'Sign In'.toUpperCase(),
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        onPressed: () {
          print('Email = ${_email.text}');
          print('Email = ${_password.text}');
          // Navigator.pushReplacement(
          //     context, MaterialPageRoute(builder: (context) => MainScreen()));
        },
      ),
    );
  }
}
