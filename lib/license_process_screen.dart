import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class LicenseProcess extends StatefulWidget {
  const LicenseProcess({Key? key}) : super(key: key);

  @override
  _LicenseProcessState createState() => _LicenseProcessState();
}

class _LicenseProcessState extends State<LicenseProcess> {
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
          'License Process',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            key: _key,
            initialUrl: 'https://guardtrainingtn.com/how-to-get-tn-security-guard-license/',
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