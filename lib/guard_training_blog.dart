import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Blog extends StatefulWidget {
  final String status;
  Blog(@required this.status);
 // const Blog({Key? key}) : super(key: key);

  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {
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
          'Guard Training Blog',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            key: _key,
            initialUrl: widget.status == '0' ? 'https://guardtrainingtn.com/blog/' : 'https://www.guardtrainingtnonline.com/' ,
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