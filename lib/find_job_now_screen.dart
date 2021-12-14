import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class FindJobNow extends StatefulWidget {
  const FindJobNow({Key? key}) : super(key: key);

  @override
  _FindJobNowState createState() => _FindJobNowState();
}

class _FindJobNowState extends State<FindJobNow> {
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
          'Find Job Now',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            key: _key,
            initialUrl: 'https://www.nashvillesecurityjob.com/',
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