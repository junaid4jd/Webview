import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class CheckLicense extends StatefulWidget {
  const CheckLicense({Key? key}) : super(key: key);

  @override
  _CheckLicenseState createState() => _CheckLicenseState();
}

class _CheckLicenseState extends State<CheckLicense> {
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
          'Check License',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            key: _key,
            initialUrl: 'https://verify.tn.gov/',
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