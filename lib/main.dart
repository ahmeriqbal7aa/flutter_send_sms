import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String message = "This is a test message!";
  List<String> recipients = ["1234567890", "5556787676"];

  /// TODO SMS Function
  void _sendSMS(String message, List<String> recipents) async {
    String _result = await sendSMS(message: message, recipients: recipents)
        .catchError((onError) {
      print(onError);
    });
    print(_result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAF9F6),
      appBar: AppBar(
        title: Text("Flutter Send SMS"),
        centerTitle: true,
        backgroundColor: Color(0xff8b0a50),
      ),
      body: Center(
        // ignore: deprecated_member_use
        child: FlatButton.icon(
          onPressed: () => _sendSMS(message, recipients),
          color: Colors.teal[700],
          icon: Icon(Icons.sms, color: Colors.white, size: 20.0),
          label: Text(
            "Send SMS",
            style: TextStyle(color: Colors.white, fontSize: 17.0),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
