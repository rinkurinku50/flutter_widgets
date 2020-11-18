import 'package:flutter/material.dart';

class FractionallySizedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FractionallySizedBoxWidget'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Expanded(
              child: FractionallySizedBox(
                heightFactor: 0.8,
                widthFactor: 0.8,
                child: RaisedButton(
                  child: Text('Find Data...'),
                  onPressed: () {},
                  color: Colors.yellow,
                  textColor: Colors.black,
                ),
              ),
            ),
          ),
          Container(
            child: Expanded(
              child: FractionallySizedBox(
                heightFactor: 0.5,
                widthFactor: 0.5,
                child: RaisedButton(
                  child: Text('Find Data...'),
                  onPressed: () {},
                  color: Colors.green,
                  textColor: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
