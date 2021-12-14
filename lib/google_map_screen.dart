import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class GoogleScreen extends StatefulWidget {
  const GoogleScreen({Key? key}) : super(key: key);

  @override
  _GoogleScreenState createState() => _GoogleScreenState();
}

class _GoogleScreenState extends State<GoogleScreen> {
  bool isLoading=true;
  final _key = UniqueKey();
  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Map',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SizedBox(
            width: devSize.width*0.85,
            height: devSize.height*0.8,
            child: Center(
              child: WebView(
                key: _key,
                initialUrl: 'https://www.google.com/maps/place/Alliance+Training+and+Testing/@36.165734,-86.7816507,17z/data=!3m1!4b1!4m5!3m4!1s0x886466577840b6cb:0x3fa73d2f72ac3bd7!8m2!3d36.165734!4d-86.779462',
                javascriptMode: JavascriptMode.unrestricted,
                onPageFinished: (finish) {
                  setState(() {
                    isLoading = false;
                  });
                },
              ),
            ),
          ),
          isLoading ? Center( child: CircularProgressIndicator(),)
              : Stack(),
        ],
      ),
    );
  }
}