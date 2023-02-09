// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, use_build_context_synchronously, camel_case_types

import 'package:finalpro_mobile/controller/auth_controller.dart';
import 'package:finalpro_mobile/screens/login/forgot_password.dart';
import 'package:finalpro_mobile/screens/login/widgets/direct_regist.dart';
import 'package:finalpro_mobile/screens/login/widgets/title.dart';
import 'package:flutter/material.dart';

import '../../common/header_widgets.dart';
import '../../common/theme_helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double _headerHeight = 250;
  // Key _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  TextEditingController _email = TextEditingController(text: 'demo@gmail.com');
  TextEditingController _password = TextEditingController(text: 'password');

  @override
  Widget build(BuildContext context) {
    AuthController authC = AuthController();
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
                  children: [
                    wTitle(),
                    SizedBox(
                      height: 30,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            child: TextFormField(
                              controller: _email,
                              keyboardType: TextInputType.emailAddress,
                              decoration: ThemeHelper().textInputDecoration(
                                'Email',
                                'Enter your Email',
                              ),
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
                            height: 30,
                          ),
                          Stack(
                            children: <Widget>[
                              Container(
                                child: TextFormField(
                                  controller: _password,
                                  obscureText: _obscureText,
                                  decoration: ThemeHelper().textInputDecoration(
                                      'Password', 'Enter Your Password'),
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
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 8),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    icon: Icon(
                                      _obscureText
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          wForgotPassword(),
                          Container(
                            decoration:
                                ThemeHelper().buttonBoxDecoration(context),
                            child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Text(
                                    'Sign In'.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                onPressed: () {
                                  if (!_formKey.currentState!.validate()) {
                                    return;
                                  }
                                  AuthController().login(
                                      _email.text, _password.text, context);
                                }
                                // AuthController()
                                //     .login(_email.text, _password.text, context),
                                //  {
                                //   if (!_formKey.currentState!.validate()) return;
                                //   final auth = Provider.of<AuthProvider>(context,
                                //       listen: false);
                                //   setState(() {
                                //     _isLoading = true;
                                //   });
                                // },
                                ),
                          ),
                        ],
                      ),
                    ),
                    DirectRegist(),
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

class wForgotPassword extends StatelessWidget {
  const wForgotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ForgotPassword()));
        },
        child: Text(
          'Forgot your Password?',
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
