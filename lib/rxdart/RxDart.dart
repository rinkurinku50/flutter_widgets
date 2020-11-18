import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class RxDart extends StatefulWidget {
  @override
  _RxDartState createState() => _RxDartState();
}

class _RxDartState extends State<RxDart> {
  @override
  Widget build(BuildContext context) {
    var subject = ReplaySubject<String>();

    subject.listen((value) {
      print("my stream 1 value $value");
    });

    subject.add("Item 1");

    subject.add("Item 2");
    subject.listen((value) {
      print("my stream 2 value $value");
    });
    subject.add("Item 3");
    subject.add("Item 4");

    return Scaffold(
      appBar: AppBar(
        title: Text('RxDart'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
