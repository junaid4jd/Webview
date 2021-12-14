import 'dart:async';
import 'dart:io';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_webview_app/ColorsRes.dart';
import 'package:flutter_webview_app/armed_screen.dart';
import 'package:flutter_webview_app/cart_screen.dart';
import 'package:flutter_webview_app/check_license_screen.dart';
import 'package:flutter_webview_app/find_job_now_screen.dart';
import 'package:flutter_webview_app/google_map_screen.dart';
import 'package:flutter_webview_app/guard_training_blog.dart';
import 'package:flutter_webview_app/home_screen_webview.dart';
import 'package:flutter_webview_app/license_process_screen.dart';
import 'package:flutter_webview_app/license_step_ebook.dart';
import 'package:flutter_webview_app/links_screen.dart';
import 'package:flutter_webview_app/online_screen.dart';
import 'package:flutter_webview_app/post_job_now.dart';
import 'package:flutter_webview_app/renew_screen.dart';
import 'package:flutter_webview_app/security_guard_tnc.dart';
import 'package:flutter_webview_app/send_message_screen.dart';
import 'package:flutter_webview_app/socialMedia/facebook_screen.dart';
import 'package:flutter_webview_app/socialMedia/gmail_screen.dart';
import 'package:flutter_webview_app/socialMedia/linked_in_screen.dart';
import 'package:flutter_webview_app/socialMedia/pintrest_screen.dart';
import 'package:flutter_webview_app/socialMedia/twitter_screen.dart';
import 'package:flutter_webview_app/socialMedia/youtube_screen.dart';
import 'package:flutter_webview_app/unarmed_screen.dart';
import 'package:flutter_webview_app/upgrade_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  bool isLoading=true;
  final _key = UniqueKey();
  late double width;
  String email = 'attcweb@securitylicensetn.com';
  //late Future<void> _launched;



  Future<void> _openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url).then((value){
        print(value.toString());
      });
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }



// flutter build appbundle --release --no-sound-null-safety
  getSliders() {
    final devSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        height: MediaQuery.of(context).orientation == Orientation.portrait ? devSize.height*0.3
        : devSize.height*0.5,
        child: Carousel(
          dotSize: 5.0,
          dotSpacing: 15.0,
          animationCurve: Curves.easeInOutSine,
          animationDuration: Duration(seconds: 1),
          autoplay: true,
          dotColor: Colors.transparent,
          indicatorBgPadding: 5.0,
          dotVerticalPadding: 5.0,
          dotBgColor: Colors.transparent,
          dotPosition: DotPosition.bottomCenter,
          dotIncreasedColor: Colors.transparent,
          images: [
            Stack(
              children: [
                Positioned.fill(
                  child:
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child:  Image.asset(
                      "assets/images/alliance1.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),

                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  getIconSliders() {
    final devSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        height: MediaQuery.of(context).orientation == Orientation.portrait ?
        devSize.height*0.16
            :  devSize.height*0.25,

        child: Carousel(
          dotSize: 5.0,
          dotSpacing: 15.0,
          animationCurve: Curves.easeInOutSine,
          animationDuration: Duration(seconds: 1),
          autoplay: true,
          dotColor: ColorsRes.textcolor,
          indicatorBgPadding: 5.0,
          dotVerticalPadding: 5.0,
          dotBgColor: Colors.transparent,
          dotPosition: DotPosition.bottomCenter,
          dotIncreasedColor: Colors.blue.withOpacity(0.3),
          images: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: devSize.height*0.03,
                  ),
                  SizedBox(
                    // height: devSize.height*0.03,
                    width: devSize.width*0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (c, a1, a2) => HomeScreenWebView(),
                                transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                                transitionDuration: Duration(milliseconds: 0),
                              ),
                            );
                          },
                          child: Material(
                            child: Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                border:
                                Border.all(color: Colors.transparent, width: 4),
                                shape: BoxShape.circle,
                              ),
                              child:
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),

                                child:Image.asset(
                                  "assets/images/home.png",
                                  fit: BoxFit.fill,
                                  height: devSize.height*0.03,
                                  width: devSize.width*0.05,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (c, a1, a2) => Pinterest(),
                                transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                                transitionDuration: Duration(milliseconds: 0),
                              ),
                            );
                          },
                          child: Material(
                            child: Container(
                                height: 65,
                                width: 65,
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(bottom: 0),
                                decoration: BoxDecoration(
                                  // border:
                                  // Border.all(color: Color(0xff3c54b4), width: 4),
                                  color: Color(0xff3c54b4),
                                  shape: BoxShape.circle,
                                ),
                                child: Text("P", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 25),)
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (c, a1, a2) => LicenseSetUpEbook(),
                                transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                                transitionDuration: Duration(milliseconds: 0),
                              ),
                            );
                          },
                          child: Material(
                            child: Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                border:
                                Border.all(color: Colors.transparent, width: 4),
                                shape: BoxShape.circle,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),

                                child:Image.asset(
                                  "assets/images/ebook.png",
                                  fit: BoxFit.fill,
                                  height: devSize.height*0.03,
                                  width: devSize.width*0.05,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (c, a1, a2) => Gmail(),
                                transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                                transitionDuration: Duration(milliseconds: 0),
                              ),
                            );
                          },
                          child: Material(
                            child:  Container(
                              height: 65,
                              width: 65,
                                alignment: Alignment.center,
                              padding: EdgeInsets.only(bottom: 0),
                              decoration: BoxDecoration(
                                // border:
                                // Border.all(color: Color(0xff3c54b4), width: 4),
                            color: Color(0xff3c54b4),
                                shape: BoxShape.circle,
                              ),
                              child: Text("G", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 25),)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: devSize.height*0.03,
                  ),
                  SizedBox(
                    // height: devSize.height*0.03,
                    width: devSize.width*0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (c, a1, a2) => FaceBook(),
                                transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                                transitionDuration: Duration(milliseconds: 0),
                              ),
                            );
                          },
                          child: Material(
                            child: Container(
                                height: 65,
                                width: 65,
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(bottom: 0),
                                decoration: BoxDecoration(
                                  // border:
                                  // Border.all(color: Color(0xff3c54b4), width: 4),
                                  color: Color(0xff3c54b4),
                                  shape: BoxShape.circle,
                                ),
                                child: Text("FB", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 25),)
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (c, a1, a2) => Youtube(),
                                transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                                transitionDuration: Duration(milliseconds: 0),
                              ),
                            );
                          },
                          child: Material(
                            child: Container(
                                height: 65,
                                width: 65,
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(bottom: 0),
                                decoration: BoxDecoration(
                                  // border:
                                  // Border.all(color: Color(0xff3c54b4), width: 4),
                                  color: Color(0xff3c54b4),
                                  shape: BoxShape.circle,
                                ),
                                child: Text("YT", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 25),)
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (c, a1, a2) => Linkedin(),
                                transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                                transitionDuration: Duration(milliseconds: 0),
                              ),
                            );
                          },
                          child: Material(
                            child: Container(
                                height: 65,
                                width: 65,
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(bottom: 0),
                                decoration: BoxDecoration(
                                  // border:
                                  // Border.all(color: Color(0xff3c54b4), width: 4),
                                  color: Color(0xff3c54b4),
                                  shape: BoxShape.circle,
                                ),
                                child: Text("IN", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 28),)
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (c, a1, a2) => Twitter(),
                                transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                                transitionDuration: Duration(milliseconds: 0),
                              ),
                            );
                          },
                          child: Material(
                            child: Container(
                                height: 65,
                                width: 65,
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(bottom: 0),
                                decoration: BoxDecoration(
                                  // border:
                                  // Border.all(color: Color(0xff3c54b4), width: 4),
                                  color: Color(0xff3c54b4),
                                  shape: BoxShape.circle,
                                ),
                                child: Text("TW", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 25),)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      drawer: Drawer(
        child: Container(
          color:Colors.grey.withOpacity(0.05),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  // shape: BoxShape.circle,
                ),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            border:
                            Border.all(color: Colors.transparent, width: 4),
                            shape: BoxShape.circle,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),

                            child:Image.asset(
                              "assets/images/alliance1.jpg",
                              fit: BoxFit.fill,
                              width: devSize.width * 0.3,
                              height: devSize.height * 0.15,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          'Allience Training \& Testing',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0,bottom: 8),
                child: GestureDetector(
                  onTap: () async {

                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) => UnArmedScreen(),
                        transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                        transitionDuration: Duration(milliseconds: 0),
                      ),
                    );
                    print('In view Profile');
                    // auth.viewProfile();
                  },
                  child: Container(
                    color: Colors.white,
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(50),

                        child:Image.asset(
                          "assets/images/unarmed.png",
                          fit: BoxFit.fill,
                          height: 35,
                          width: 35,
                        ),
                      ),
                      title: Text('Unarmed'),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0,bottom: 8),
                child: GestureDetector(
                  onTap: () async {

                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) => OnlineScreen(),
                        transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                        transitionDuration: Duration(milliseconds: 0),
                      ),
                    );
                    print('In view Profile');
                    // auth.viewProfile();
                  },
                  child: Container(
                    color: Colors.white,
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(50),

                        child:Image.asset(
                          "assets/images/online.png",
                          fit: BoxFit.fill,
                          height: 35,
                          width: 35,
                        ),
                      ),
                      title: Text('Online'),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0,bottom: 8),
                child: GestureDetector(
                  onTap: () async {

                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) => Armed(),
                        transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                        transitionDuration: Duration(milliseconds: 0),
                      ),
                    );
                    print('In view Profile');
                    // auth.viewProfile();
                  },
                  child: Container(
                    color: Colors.white,
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(50),

                        child:Image.asset(
                          "assets/images/armed.png",
                          fit: BoxFit.fill,
                          height: 35,
                          width: 35,
                        ),
                      ),
                      title: Text('Armed'),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0,bottom: 8),
                child: GestureDetector(
                  onTap: () async {

                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) => UpGradeScreen(),
                        transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                        transitionDuration: Duration(milliseconds: 0),
                      ),
                    );
                    print('In view Profile');
                    // auth.viewProfile();
                  },
                  child: Container(
                    color: Colors.white,
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(50),

                        child:Image.asset(
                          "assets/images/upgrade.png",
                          fit: BoxFit.fill,
                          height: 35,
                          width: 35,
                        ),
                      ),
                      title: Text('Upgrade to Armed'),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0,bottom: 8),
                child: GestureDetector(
                  onTap: () async {

                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) => RenewScreen(),
                        transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                        transitionDuration: Duration(milliseconds: 0),
                      ),
                    );
                    print('In view Profile');
                    // auth.viewProfile();
                  },
                  child: Container(
                    color: Colors.white,
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(50),

                        child:Image.asset(
                          "assets/images/renew.png",
                          fit: BoxFit.fill,
                          height: 35,
                          width: 35,
                        ),
                      ),
                      title: Text('Renew Armed'),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Alliance Training',
          style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            iconSize: 25,
            icon: Icon(
              Icons.my_location_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => GoogleScreen(),
                  transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                  transitionDuration: Duration(milliseconds: 0),
                ),
              );

            },
            //onPressed
          ),
          IconButton(
            iconSize: 25,
            icon: Icon(
              Icons.add_shopping_cart_sharp,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => CartScreen(),
                  transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                  transitionDuration: Duration(milliseconds: 0),
                ),
              );

            },
            //onPressed
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            getSliders(),


            Container(
              decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 20,left: 5,right: 5),
                child: Column(
                  children: [

                    SizedBox(
                      // height: devSize.height*0.03,
                      width: devSize.width*0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (c, a1, a2) => CheckLicense(),
                                  transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                                  transitionDuration: Duration(milliseconds: 0),
                                ),
                              );
                            },
                            child: Material(
                              child: Column(
                                children: [
                                  Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Colors.transparent, width: 4),
                                      shape: BoxShape.circle,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child:Image.asset(
                                        "assets/images/checkLicense.png",
                                        fit: BoxFit.fill,
                                        height: devSize.height*0.03,
                                        width: devSize.width*0.05,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Check A License", style: TextStyle(color: Color(0xff3c54b4),fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (c, a1, a2) => FindJobNow(),
                                  transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                                  transitionDuration: Duration(milliseconds: 0),
                                ),
                              );
                            },
                            child: Material(
                              child: Column(
                                children: [
                                  Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Colors.transparent, width: 4),
                                      shape: BoxShape.circle,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),

                                      child:Image.asset(
                                        "assets/images/newJob.png",
                                        fit: BoxFit.fill,
                                        height: devSize.height*0.03,
                                        width: devSize.width*0.05,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Find A Job Now", style: TextStyle(color: Color(0xff3c54b4),fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (c, a1, a2) => PostNewJob(),
                                  transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                                  transitionDuration: Duration(milliseconds: 0),
                                ),
                              );
                            },
                            child: Material(
                              child: Column(
                                children: [
                                  Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Colors.transparent, width: 4),
                                      shape: BoxShape.circle,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),

                                      child:Image.asset(
                                        "assets/images/postjob.png",
                                        fit: BoxFit.fill,
                                        height: devSize.height*0.03,
                                        width: devSize.width*0.05,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Post A Job Now", style: TextStyle(color: Color(0xff3c54b4),fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),

                    SizedBox(
                      height: devSize.height*0.03,
                    ),
                    SizedBox(
                      // height: devSize.height*0.03,
                      width: devSize.width*0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (c, a1, a2) => LicenseProcess(),
                                  transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                                  transitionDuration: Duration(milliseconds: 0),
                                ),
                              );
                            },
                            child: Material(
                              child: Column(
                                children: [
                                  Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Colors.transparent, width: 4),
                                      shape: BoxShape.circle,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child:Image.asset(
                                        "assets/images/licenseprocess.png",
                                        fit: BoxFit.fill,
                                        height: devSize.height*0.03,
                                        width: devSize.width*0.05,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "License Process", style: TextStyle(color: Color(0xff3c54b4),fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (c, a1, a2) => LicenseSetUpEbook(),
                                  transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                                  transitionDuration: Duration(milliseconds: 0),
                                ),
                              );
                            },
                            child: Material(
                              child: Column(
                                children: [
                                  Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Colors.transparent, width: 4),
                                      shape: BoxShape.circle,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child:Image.asset(
                                        "assets/images/ebook.png",
                                        fit: BoxFit.fill,
                                        height: devSize.height*0.03,
                                        width: devSize.width*0.05,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "License Steps EBook", style: TextStyle(color: Color(0xff3c54b4),fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (c, a1, a2) => Blog("0"),
                                  transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                                  transitionDuration: Duration(milliseconds: 0),
                                ),
                              );
                            },
                            child: Material(
                              child: Column(
                                children: [
                                  Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Colors.transparent, width: 4),
                                      shape: BoxShape.circle,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child:Image.asset(
                                        "assets/images/bell.png",
                                        fit: BoxFit.fill,
                                        height: devSize.height*0.03,
                                        width: devSize.width*0.05,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Blog", style: TextStyle(color: Color(0xff3c54b4),fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),



                        ],
                      ),
                    ),

                    SizedBox(
                      height: devSize.height*0.03,
                    ),
                    SizedBox(
                      // height: devSize.height*0.03,
                      width: devSize.width*0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (c, a1, a2) => Blog("1"),
                                  transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                                  transitionDuration: Duration(milliseconds: 0),
                                ),
                              );
                            },
                            child: Material(
                              child: Column(
                                children: [
                                  Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Colors.transparent, width: 4),
                                      shape: BoxShape.circle,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),

                                      child:Image.asset(
                                        "assets/images/paper.png",
                                        fit: BoxFit.fill,
                                        height: devSize.height*0.03,
                                        width: devSize.width*0.05,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Online Training", style: TextStyle(color: Color(0xff3c54b4),fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              print('mailto:$email');
                              setState(() {
                                _openUrl('mailto:$email');
                                });
                              // Navigator.push(
                              //   context,
                              //   PageRouteBuilder(
                              //     pageBuilder: (c, a1, a2) => SendMessage(),
                              //     transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                              //     transitionDuration: Duration(milliseconds: 0),
                              //   ),
                              // );
                            },
                            child: Material(
                              child: Column(
                                children: [
                                  Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Colors.transparent, width: 4),
                                      shape: BoxShape.circle,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),

                                      child:Image.asset(
                                        "assets/images/sendmessage.png",
                                        fit: BoxFit.fill,
                                        height: devSize.height*0.03,
                                        width: devSize.width*0.05,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Send A Message", style: TextStyle(color: Color(0xff3c54b4),fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (c, a1, a2) => Links(),
                                  transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                                  transitionDuration: Duration(milliseconds: 0),
                                ),
                              );
                            },
                            child: Material(
                              child: Column(
                                children: [
                                  Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Colors.transparent, width: 4),
                                      shape: BoxShape.circle,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),

                                      child:Image.asset(
                                        "assets/images/lock.png",
                                        fit: BoxFit.fill,
                                        height: devSize.height*0.03,
                                        width: devSize.width*0.05,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Links", style: TextStyle(color: Color(0xff3c54b4),fontSize: 12),
                                    ),
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



            // getIconSliders(),


          ],
        ),
      ),
    );
  }
}
