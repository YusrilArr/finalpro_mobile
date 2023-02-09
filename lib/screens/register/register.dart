// ignore_for_file: prefer_is_not_empty, prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, avoid_print

import 'package:finalpro_mobile/common/header_widgets.dart';
import 'package:finalpro_mobile/common/theme_helper.dart';
import 'package:finalpro_mobile/controller/auth_controller.dart';
import 'package:finalpro_mobile/providers/auth_provider.dart';
import 'package:finalpro_mobile/screens/login/forgot_password.dart';
import 'package:finalpro_mobile/screens/login/login.dart';
import 'package:finalpro_mobile/screens/register/verif_email.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConf = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _passwordConf.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (!_formKey.currentState!.validate()) return;
    addUserDetails(
      _nameController.text.trim(),
      _emailController.text.trim(),
      int.parse(_phoneController.text.trim()),
      _addressController.text.trim(),
      _passwordController.text.trim(),
    );
  }

  Future addUserDetails(String name, String email, int phone, String address,
      String password) async {
    AuthController().signUp(email, password);
    await FirebaseFirestore.instance.collection('user').add({
      'Full name': name,
      'Email': email,
      'Phone': phone,
      'Address': address,
      'Password': password,
    });
  }

  bool _obsecureText = true;

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 150,
              child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      width: 5,
                                      color: Colors.white,
                                    ),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 20,
                                          offset: Offset(5, 5))
                                    ]),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.grey.shade300,
                                  size: 80,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(80, 80, 0, 0),
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.grey.shade700,
                                  size: 25,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: TextFormField(
                            textCapitalization: TextCapitalization.words,
                            controller: _nameController,
                            decoration: ThemeHelper().textInputDecoration(
                                'Full Name', 'Enter your Name!'),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Required';
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: TextFormField(
                            controller: _emailController,
                            decoration: ThemeHelper().textInputDecoration(
                                'Email address', 'Enter your email'),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Required';
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: TextFormField(
                            controller: _phoneController,
                            decoration: ThemeHelper().textInputDecoration(
                              'Mobile Number',
                              'Enter your mobile number',
                            ),
                            keyboardType: TextInputType.number,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Required';
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: TextFormField(
                            controller: _addressController,
                            decoration: ThemeHelper().textInputDecoration(
                                'Address', 'Enter your Address!'),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Required';
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Stack(children: [
                          Container(
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: _obsecureText,
                              decoration: ThemeHelper().textInputDecoration(
                                  "Password", "Enter your password"),
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
                                  _obsecureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obsecureText = !_obsecureText;
                                  });
                                },
                              ),
                            ),
                          ),
                        ]),
                        SizedBox(
                          height: 20,
                        ),
                        Stack(
                          children: [
                            Container(
                              child: TextFormField(
                                controller: _passwordConf,
                                obscureText: _obsecureText,
                                decoration: ThemeHelper().textInputDecoration(
                                    "Re-Type Password",
                                    "Confirmation your password"),
                                // validator: (val) => confPassword(
                                //     value: 'val',
                                //     match: _passwordController.text),
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
                                    _obsecureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obsecureText = !_obsecureText;
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
                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: checkboxValue,
                                        onChanged: (value) {
                                          setState(() {
                                            checkboxValue = value!;
                                            state.didChange(value);
                                          });
                                        }),
                                    Text(
                                      "I accept all terms and conditions.",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Theme.of(context).errorColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                          validator: (value) {
                            if (!checkboxValue) {
                              return 'You need to accept terms and conditions';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            onPressed: () async {
                              var credential = await AuthController().signUp(
                                  _emailController.text,
                                  _passwordController.text);
                              var newuserid = credential.user!.uid;

                              await firestore
                                  .collection('users')
                                  .doc(newuserid)
                                  .set({
                                'email': _emailController.text,
                                'password': _passwordController.text,
                                'address': _addressController.text,
                                'balance': '0',
                                'name': _nameController.text,
                                'phone': _phoneController.text,
                              });

                              // await user.add({
                              //   'name': _nameController.text,
                              //   'email': _emailController.text,
                              //   'address': _addressController.text,
                              //   'phone': _phoneController.text,
                              //   'password': _passwordController.text,
                              //   'balance': '0',
                              // }).then((value) => print('User added'));

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ));

                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return VerifEmail();
                                },
                              );
                            },
                            // () {
                            //   user.add({
                            //     'address': _addressController.text,
                            //     'email': _emailController.text,
                            //     'name': _nameController.text,
                            //     'password': _passwordController.text,
                            //     'phone': _phoneController.text,
                            //   });

                            //   Navigator.pushReplacement(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) => LoginPage()));
                            // },
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                'Register'.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: 'Already have an account? '),
                                TextSpan(
                                  text: 'Sign in',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()));
                                    },
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).accentColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Or create an account using social media',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: FaIcon(
                                FontAwesomeIcons.googlePlus,
                                size: 35,
                                color: HexColor("#EC2D2F"),
                              ),
                              onTap: () {
                                setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ThemeHelper().alartDialog(
                                          "Google Plus",
                                          "You tap on GooglePlus social icon.",
                                          context);
                                    },
                                  );
                                });
                              },
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            GestureDetector(
                              child: Container(
                                padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 5, color: HexColor("#40ABF0")),
                                  color: HexColor("#40ABF0"),
                                ),
                                child: FaIcon(
                                  FontAwesomeIcons.twitter,
                                  size: 23,
                                  color: HexColor("#FFFFFF"),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ThemeHelper().alartDialog(
                                          "Twitter",
                                          "You tap on Twitter social icon.",
                                          context);
                                    },
                                  );
                                });
                              },
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            GestureDetector(
                              child: FaIcon(
                                FontAwesomeIcons.facebook,
                                size: 35,
                                color: HexColor("#3E529C"),
                              ),
                              onTap: () {
                                setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ThemeHelper().alartDialog(
                                          "Facebook",
                                          "You tap on Facebook social icon.",
                                          context);
                                    },
                                  );
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _registerSementara() async {
    print('Full name : ${_nameController.text}');
    print('Email : ${_emailController.text}');
    print('Phone : ${_phoneController.text}');
    print('Address : ${_addressController.text}');
    print('Password : ${_passwordController.text}');
    print('Retype : ${_passwordConf.text}');

    setState(() {});

    await Future.delayed(Duration(seconds: 2));
    wShowToast('Registration success!, please Log in to your account.');

    // if (_emailController.text == 'tes@gmail.com' &&
    //     _passwordController == 'password' &&
    //     _nameController == 'tes' &&
    //     _phoneController == '123' &&
    //     _addressController == 'tangerang' &&
    //     _passwordConf == 'password') {
    //   setState(() {});
    //   await Future.delayed(Duration(seconds: 2));
    //   wShowToast('Registration success!, please Log in to your account.');
    //   Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => LoginPage(),
    //       ));
    // } else {
    //   print('Gagal Regist');
    // }
  }
}
