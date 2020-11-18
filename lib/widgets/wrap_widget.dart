import 'package:flutter/material.dart';

class WrapWidget extends StatefulWidget {
  @override
  _WrapWidgetState createState() => _WrapWidgetState();
}

class _WrapWidgetState extends State<WrapWidget> {
  double customWidth = 0.0;
  double mediaQu = 0;
  Widget customContainer(color) {
    return Container(
      width: MediaQuery.of(context).size.width * (customWidth * 0.01),
      height: 100,
      child: Material(
        elevation: 15.0,
        borderRadius: BorderRadius.circular(10.0),
        color: color,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    customWidth = 20;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap Widget'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Wrap(
              direction: Axis.horizontal,
              spacing: 12.0,
              alignment: WrapAlignment.center,
              runSpacing: 18.0,
              children: [
                customContainer(Colors.red),
                customContainer(Colors.green),
                customContainer(Colors.grey),
                customContainer(Colors.black),
                customContainer(Colors.orange),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            Slider(
              min: 0,
              max: 100,
              value: customWidth,
              onChanged: (value) {
                setState(() {
                  customWidth = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
