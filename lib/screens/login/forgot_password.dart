// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:finalpro_mobile/common/header_widgets.dart';
import 'package:finalpro_mobile/common/theme_helper.dart';
import 'package:finalpro_mobile/providers/auth_provider.dart';
import 'package:finalpro_mobile/screens/login/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  double _headerHeight = 250;
  // Key _formKey = GlobalKey<FormState>();
  TextEditingController _emailForgot = TextEditingController();
  // Key _keyForm = GlobalKey<FormState>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.wallet),
            ),
            SafeArea(
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Forgot your Password ?',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Enter your email and we will send you a link to reset your password',
                      style: TextStyle(
                          color: Colors.grey[600], fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            child: TextFormField(
                              controller: _emailForgot,
                              decoration: ThemeHelper().textInputDecoration(
                                  'Email', 'Enter your Email'),
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration:
                                ThemeHelper().buttonBoxDecoration(context),
                            child: ElevatedButton(
                              style: ThemeHelper().buttonStyle(),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                child: Text(
                                  'Send'.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              onPressed: () {
                                if (!_formKey.currentState!.validate()) return;
                                final auth = Provider.of<AuthProvider>(context,
                                    listen: false);
                                setState(() {
                                  _isLoading = true;
                                });

                                auth.resetPassword(
                                    context: context,
                                    emailForgot: _emailForgot.text);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(text: 'Back to '),
                                  TextSpan(
                                    text: 'Log in',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => LoginPage(),
                                          ),
                                        );
                                      },
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).accentColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// 'Email Sended! Please check your email to reset password.'

Future wShowToast(String msg) {
  return Fluttertoast.showToast(
    msg: msg,
    backgroundColor: Colors.black54,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_LONG,
  );
}
