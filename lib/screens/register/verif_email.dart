// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:finalpro_mobile/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerifEmail extends StatefulWidget {
  const VerifEmail({super.key});

  @override
  State<VerifEmail> createState() => _VerifEmailState();
}

class _VerifEmailState extends State<VerifEmail> {
  bool _isLoading = false;
  bool _isSended = false;

  Widget _resendEmailButton() {
    return Column(
      children: [
        Text('Din\'t receive an email ?'),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () async {
              setState(() {
                _isLoading = true;
              });
              final auth = Provider.of<AuthProvider>(context, listen: false);
              await auth.resendEmailVerif();

              setState(() {
                _isLoading = false;
                _isSended = true;
              });
            },
            child: Text(_isLoading ? 'Sending' : 'Resend'))
      ],
    );
  }

  Widget _resendEmailMsg() {
    return Container(
      child: Text(
        'Email Sended!',
        style: TextStyle(color: Colors.blue),
      ),
    );
  }

  Widget _bottomWidget() {
    return _isSended ? _resendEmailMsg() : _resendEmailButton();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height / 1.2,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(10),
              child: Icon(Icons.drag_handle),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.alternate_email,
                    size: 50,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Verify your email',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'We have send an email with confirmation link\n to your email address',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(
                    height: 40,
                    indent: 50,
                    endIndent: 50,
                  ),
                  Text(
                    'Please click on that to verify your email\n and continue the registration process',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Divider(
                    height: 40,
                    indent: 50,
                    endIndent: 50,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  _bottomWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
