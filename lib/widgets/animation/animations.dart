import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class AnimationsWidget extends StatefulWidget {
  @override
  _AnimationsWidgetState createState() => _AnimationsWidgetState();
}

class _AnimationsWidgetState extends State<AnimationsWidget>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);

    animation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    animationController.forward();
  }

  void animateValue() {
    animation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.bounceInOut));
    animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    double doubleWidth = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: Text('Animation Widget')),
      body: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.translationValues(
                0.0, animation.value * doubleWidth, 0.0),
            child: Center(
              child: Container(
                child: RaisedButton(
                  child: Text('Login button'),
                  onPressed: () {
                    setState(() {
                      animateValue();
                    });
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AnimationWithMoveUpDawn extends StatefulWidget {
  @override
  _AnimationWithMoveUpDawnState createState() =>
      _AnimationWithMoveUpDawnState();
}

class _AnimationWithMoveUpDawnState extends State<AnimationWithMoveUpDawn>
    with SingleTickerProviderStateMixin {
  Animation animation, animation2;
  AnimationController animationController;
  bool checkVal = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //animation=Tween()
    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = Tween(begin: 0.0, end: -0.12).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    animation2 = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)));
  }

  @override
  Widget build(BuildContext context) {
    double widthOf = MediaQuery.of(context).size.width;
    return Scaffold(
      body: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Center(
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: 350.0,
                    height: 200.0,
                    alignment: Alignment.bottomCenter,
                    transform: Matrix4.translationValues(
                        animation2.value * widthOf, 0.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                            child: Text("Follow"),
                            color: Colors.blue,
                            textColor: Colors.white,
                            onPressed: () {}),
                        SizedBox(
                          width: 15.0,
                        ),
                        RaisedButton(
                            child: Text("Cancel"),
                            color: Colors.blue,
                            textColor: Colors.white,
                            onPressed: () {})
                      ],
                    ),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    child: Container(
                      width: 350.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          image: DecorationImage(
                              image: AssetImage('images/naturewall.jpg'))),
                      transform: Matrix4.translationValues(
                          0.0, animation.value * widthOf, 0.0),
                    ),
                    onTap: () {
                      if (checkVal == false) {
                        animationController.forward();
                        setState(() {
                          checkVal = true;
                        });
                      } else {
                        animationController.reverse();
                        setState(() {
                          checkVal = true;
                        });
                      }
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
