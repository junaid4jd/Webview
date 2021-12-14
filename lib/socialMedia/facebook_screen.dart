import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class FaceBook extends StatefulWidget {
  const FaceBook({Key? key}) : super(key: key);

  @override
  _FaceBookState createState() => _FaceBookState();
}

class _FaceBookState extends State<FaceBook> {
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
          'Facebook',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            key: _key,
            initialUrl: 'https://www.facebook.com/GuardTrainingTN',
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