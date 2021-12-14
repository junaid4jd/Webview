import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class RenewScreen extends StatefulWidget {
  const RenewScreen({Key? key}) : super(key: key);

  @override
  _RenewScreenState createState() => _RenewScreenState();
}

class _RenewScreenState extends State<RenewScreen> {
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
          'Renew',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            key: _key,
            initialUrl: 'https://armed-unarmed-security-license-training-class-tn.ecwid.com/products/RENEW-Armed-Security-License-Training-Class-TN-Reservation-Fee-p64346116',
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