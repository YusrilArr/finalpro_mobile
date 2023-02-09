import 'package:finalpro_mobile/controller/auth_controller.dart';
import 'package:finalpro_mobile/providers/auth_provider.dart';
import 'package:finalpro_mobile/screens/intro/splash_screen.dart';
import 'package:finalpro_mobile/screens/login/login.dart';
import 'package:finalpro_mobile/screens/main/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => AuthProvider(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authC.streamAuthStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          print(snapshot.data);
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'DoSa',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: snapshot.data != null
              ? const MainScreen()
              : const SplashScreens(title: 'intro'),
        );
      },
    );
  }
}
