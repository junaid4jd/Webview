import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Linkedin extends StatefulWidget {
  const Linkedin({Key? key}) : super(key: key);

  @override
  _LinkedinState createState() => _LinkedinState();
}

class _LinkedinState extends State<Linkedin> {
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
          'Linkedin',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            key: _key,
            initialUrl: 'https://www.linkedin.com/showcase/guardtrainingtn',
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