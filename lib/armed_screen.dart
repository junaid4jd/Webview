import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Armed extends StatefulWidget {
  const Armed({Key? key}) : super(key: key);

  @override
  _ArmedState createState() => _ArmedState();
}

class _ArmedState extends State<Armed> {
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
        title: Text(
          'Armed',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            key: _key,
            initialUrl: 'https://armed-unarmed-security-license-training-class-tn.ecwid.com/products/Armed-Security-License-Training-Class-TN-Reservation-Fee-p44362271',
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