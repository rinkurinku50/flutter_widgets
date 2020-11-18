import 'package:flutter/material.dart';

class TransfromDemo extends StatefulWidget {
  @override
  _TransfromDemoState createState() => _TransfromDemoState();
}

class _TransfromDemoState extends State<TransfromDemo> {
  double sliderValue;
  double mybox;
  Slider getSlider() {
    return Slider(
      value: sliderValue,
      min: 0,
      max: 100,
      onChanged: (value) {
        setState(() {
          sliderValue = value;
        });
      },
    );
  }

  Builder translatePro() {
    double preHe = MediaQuery.of(context).size.height -
        ((MediaQuery.of(context).padding.top + kToolbarHeight) + 100);
    //print(preHe * sliderValue * 0.01);
    //print(preHe);
    //print(MediaQuery.of(context).size.height - 87.0);
    return Builder(
      builder: (context) {
        return Container(
          child: Transform.translate(
            offset: Offset(0.0, -(preHe * (sliderValue * 0.01))),
            child: Container(
              height: 100.0,
              width: mybox,
              color: Colors.yellow,
            ),
          ),
        );
      },
    );
  }

  Container threeD() {
    return Container(
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, sliderValue / 1000)
          ..rotateX(3.14 / 20.0),
        alignment: FractionalOffset.center,
        origin: Offset(0.0, 0.0),
        child: Container(
          height: 100.0,
          width: 100.0,
          color: Colors.pink,
        ),
      ),
    );
  }

  Container skew() {
    return Container(
      child: Transform(
        transform: Matrix4.skewX(sliderValue / 100),
        origin: Offset(0.0, 0.0),
        child: Container(
          height: 100.0,
          width: 100.0,
          color: Colors.grey,
        ),
      ),
    );
  }

  Container scalePro() {
    return Container(
      child: Transform.scale(
        scale: sliderValue * 0.01,
        origin: Offset(0.0, 0.0),
        child: Container(
          height: 100.0,
          width: 100.0,
          color: Colors.green,
        ),
      ),
    );
  }

  Container rotatePro() {
    return Container(
      child: Transform.rotate(
        angle: sliderValue,
        origin: Offset(0.0, 0.0),
        child: Container(
          height: 50.0,
          width: 50.0,
          color: Colors.red,
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sliderValue = 50;
    mybox = 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transform Widget'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getSlider(),
            rotatePro(),
            scalePro(),
            translatePro(),
            skew(),
            threeD()
          ]),
    );
  }
}
