import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class UpGradeScreen extends StatefulWidget {
  const UpGradeScreen({Key? key}) : super(key: key);

  @override
  _UpGradeScreenState createState() => _UpGradeScreenState();
}

class _UpGradeScreenState extends State<UpGradeScreen> {
  bool isLoading=true;
  final _key = UniqueKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Up Grade',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            key: _key,
            initialUrl: 'https://armed-unarmed-security-license-training-class-tn.ecwid.com/products/UPGRADE-Armed-Security-License-Training-Class-TN-Reservation-Fee-p64346117',
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading ? Center( child: CircularProgressIndicator(),)
              : Stack(),
        ],
      ),
    );
  }
}