import 'package:flutter/material.dart';

class EmailSenderScreen extends StatefulWidget {
  const EmailSenderScreen({Key? key}) : super(key: key);

  @override
  _EmailSenderScreenState createState() => _EmailSenderScreenState();
}

class _EmailSenderScreenState extends State<EmailSenderScreen> {
  final _recipientController = TextEditingController(
    text: 'example@example.com',
  );

  final _subjectController = TextEditingController(text: 'The subject');

  final _bodyController = TextEditingController(
    text: 'Mail body.',
  );
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
