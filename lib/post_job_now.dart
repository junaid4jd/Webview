import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class PostNewJob extends StatefulWidget {
  const PostNewJob({Key? key}) : super(key: key);

  @override
  _PostNewJobState createState() => _PostNewJobState();
}

class _PostNewJobState extends State<PostNewJob> {
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
          'Post New Job',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            key: _key,
            initialUrl: 'https://docs.google.com/forms/d/e/1FAIpQLSfsH9WpXCNEc3M8KfDf3b-QbbX6EE-wbgt8XR04BEcKnRQ2cw/viewform',
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