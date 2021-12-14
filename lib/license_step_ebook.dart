import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class LicenseSetUpEbook extends StatefulWidget {
  const LicenseSetUpEbook({Key? key}) : super(key: key);

  @override
  _LicenseSetUpEbookState createState() => _LicenseSetUpEbookState();
}

class _LicenseSetUpEbookState extends State<LicenseSetUpEbook> {
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
          'License SetUp E-book',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            key: _key,
            initialUrl: 'https://drive.google.com/file/d/1k6EAdTOO9gGxEIeR62ZQLheYB3Ddg-_B/view',
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