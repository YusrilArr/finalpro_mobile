import 'package:finalpro_mobile/screens/register/register.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DirectRegist extends StatefulWidget {
  const DirectRegist({
    super.key,
  });

  @override
  State<DirectRegist> createState() => _DirectRegistState();
}

class _DirectRegistState extends State<DirectRegist> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: 'Dont have an account? '),
            TextSpan(
              text: 'Create',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationPage()));
                },
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor),
            ),
          ],
        ),
      ),
    );
  }
}
