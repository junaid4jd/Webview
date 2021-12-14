
import 'package:flutter/material.dart';
import 'package:flutter_webview_app/home/home_screen.dart';
import 'package:flutter_webview_app/splash/splash_screen.dart';

import 'home/app_bottom_navigationbar_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        //   keytool -genkey -v -keystore C:\Users\nouma\AndroidStudioProjects\flutter_webview_app\alliance.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
