import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import './firebase_model.dart';

class FirebaseMessages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Firebase Messages')),
        body: FirebaseMessDemo());
  }
}

class FirebaseMessDemo extends StatefulWidget {
  @override
  _FirebaseMessDemoState createState() => _FirebaseMessDemoState();
}

class _FirebaseMessDemoState extends State<FirebaseMessDemo> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  List<Messages> _messages;
  _getToken() {
    _firebaseMessaging.getToken().then((value) {
      print("Device Token: $value");
    });
  }

  _firebaselistenerConfig() {

    _firebaseMessaging.configure(
      // onBackgroundMessage: onBackData,
      onMessage: (message) async {
        print('onMessage: $message');
        _getMessages(message);
      },
      onLaunch: (message) async {
        print('onMessage: $message');
        _getMessages(message);
      },
      onResume: (message) async {
        print('onMessage: $message');
        _getMessages(message);
      },
    );
  }

  Future<Map<String,dynamic>> onBackData() async {

  }

  _getMessages(Map<String, dynamic> message) {
    var notification = message['notification'];
    var data = message['data'];
    String title = notification['title'];
    String body = notification['body'];
    String mMessage = data['message'];
    setState(() {
      Messages m = Messages(title, body, mMessage);
      _messages.add(m);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _messages = List<Messages>();
    _getToken();
    _firebaselistenerConfig();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemCount: _messages == null ? 0 : _messages.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(_messages[index].message,
                style: TextStyle(fontSize: 18.0)),
          ),
        );
      },
    ));
  }
}
