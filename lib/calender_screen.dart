import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class CalenderScreen extends StatefulWidget {
  const CalenderScreen({Key? key}) : super(key: key);

  @override
  _CalenderScreenState createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
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
          'Calender',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SizedBox(
            width: devSize.width*0.95,
            height: devSize.height*0.7,
            child: Center(
              child: WebView(
                key: _key,
                initialUrl: 'https://calendar.google.com/calendar/u/0/embed?color=%239fc6e7&src=alliancetrainingresources.com_e02pg93ang5a52sji2sop2rs6c@group.calendar.google.com',
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