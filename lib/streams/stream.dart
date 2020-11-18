import 'dart:async';

import 'package:flutter/material.dart';

class StreamData extends StatefulWidget {
  @override
  _StreamDataState createState() => _StreamDataState();
}

class _StreamDataState extends State<StreamData> {
  StreamController streamController;

  addData() async {
    for (int i = 1; i <= 10; i++) {
      await Future.delayed(Duration(seconds: 1));
      streamController.sink.add(i);
    }
  }

  Stream<int> addNewData() async* {
    for (int i = 1; i <= 10; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    streamController = StreamController();
    addData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Builder'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: StreamBuilder(
                stream: streamController.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('hey there is some errror...');
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  return Text(
                    snapshot.data.toString(),
                    style: TextStyle(fontSize: 25.0),
                  );
                },
              ),
            ),
            SizedBox(
              height: 45.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                    child: Text('Start'),
                    onPressed: () {
                      //streamController.sink.;
                    }),
                SizedBox(width: 25.0),
                RaisedButton(child: Text('Stop'), onPressed: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
