import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class HomeScreenWebView extends StatefulWidget {
  const HomeScreenWebView({Key? key}) : super(key: key);

  @override
  _HomeScreenWebViewState createState() => _HomeScreenWebViewState();
}

class _HomeScreenWebViewState extends State<HomeScreenWebView> {
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
          'Home',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            key: _key,
            initialUrl: 'https://sites.google.com/securitylicensetn.com/alliance-mobile/home',
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
