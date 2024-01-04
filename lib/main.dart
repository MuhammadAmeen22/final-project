import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/contactus_page.dart';
import 'package:untitled3/loginScreen.dart';
import 'package:untitled3/regProvder.dart';
import 'package:untitled3/regScreen.dart';
import 'dollar_to_inr.dart';
import 'inr_to_dollar.dart';
import 'NavBar.dart';
import 'chart_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'WelcomeScreen.dart';
import 'loginProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyDLCk-CQClhxlVGpr6NJaWEnQzbgOllWOw',
          appId: '1:482040853447:android:2c4a5bc3ca3478e4861fe2',
          messagingSenderId: '482040853447',
          projectId: 'currency-project-30d4c'));
  //
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: Colors.transparent,
  // ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => regProvider()),
          ChangeNotifierProvider(create: (context) => LoginProvider())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: ('inter'),
            useMaterial3: true,
          ),
          home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, usrSnp) {
                if (usrSnp.hasData) {
                  return DollarToINR();
                } else {
                  return WelcomeScreen();
                }
              }),
        ));
  }
}
