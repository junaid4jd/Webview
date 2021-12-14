import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Pinterest extends StatefulWidget {
  const Pinterest({Key? key}) : super(key: key);

  @override
  _PinterestState createState() => _PinterestState();
}

class _PinterestState extends State<Pinterest> {
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
          'Pinterest',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            key: _key,
            initialUrl: 'https://www.pinterest.com/GuardTrainingTN/',
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