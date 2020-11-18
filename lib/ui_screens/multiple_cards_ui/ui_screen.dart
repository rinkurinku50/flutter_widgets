import 'package:flutter/material.dart';

class CardUi extends StatefulWidget {
  @override
  _CardUiState createState() => _CardUiState();
}

class _CardUiState extends State<CardUi> with SingleTickerProviderStateMixin {
  Animation cardAnimation, delayedCardAnimation, fabButtonAnim, infoAnimation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    cardAnimation = Tween(begin: 0.0, end: -0.03).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    delayedCardAnimation = Tween(begin: 0.0, end: -0.06).animate(
        CurvedAnimation(
            parent: animationController,
            curve: Interval(0.4, 1.0, curve: Curves.fastOutSlowIn)));
    infoAnimation = Tween(begin: 0.0, end: 0.03).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.7, 1.0, curve: Curves.fastOutSlowIn)));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    double subHeight = MediaQuery.of(context).size.height;
    double subWidth = MediaQuery.of(context).size.width;
    print(subWidth * 0.80);
    animationController.forward();
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Card Ui',
            style: TextStyle(fontSize: 18.0, color: Colors.black),
          ),
          leading: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          elevation: 0.0,
          actions: [
            Container(
              padding: EdgeInsets.only(right: 15.0),
              child: FlutterLogo(
                style: FlutterLogoStyle.markOnly,
                size: 30.0,
              ),
            )
          ],
        ),
        body: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25.0,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
                  child: Center(
                    child: Stack(
                      overflow: Overflow.visible,
                      children: [
                        Positioned(
                          left: 20.0,
                          child: Container(
                            width: subWidth * 0.70,
                            height: 400.0,
                            transform: Matrix4.translationValues(0.0,
                                delayedCardAnimation.value * subHeight, 0.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.amber),
                          ),
                        ),
                        Positioned(
                          left: 10.0,
                          child: Container(
                            width: subWidth * 0.75,
                            height: 400.0,
                            transform: Matrix4.translationValues(
                                0.0, cardAnimation.value * subHeight, 0.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Container(
                          width: subWidth * 0.80,
                          height: 400.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: AssetImage('images/girl.jpeg'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        Positioned(
                            top: 330.0,
                            left: (subWidth * 0.80) / 2 - (subWidth * 0.50) / 2,
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              width: (subWidth * 0.50),
                              height: 80.0,
                              transform: Matrix4.translationValues(
                                  0.0, infoAnimation.value * subHeight, 0.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 1.0,
                                        color: Colors.black12,
                                        spreadRadius: 2.0)
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                            text: 'Kayla',
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                            children: [
                                              WidgetSpan(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5.0),
                                                    child: Image.asset(
                                                      'images/simbolo.png',
                                                      height: 20.0,
                                                      width: 20.0,
                                                    ),
                                                  ),
                                                  alignment:
                                                      PlaceholderAlignment
                                                          .middle)
                                            ]),
                                      ),
                                      Text('5.8km',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black26,
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Container(
                                    child: Text(
                                      'Fate is Wonderfull',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black38),
                                    ),
                                  )
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25.0),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton(
                          child: Icon(
                            Icons.close,
                            color: Colors.black,
                            size: 30.0,
                          ),
                          backgroundColor: Colors.white,
                          onPressed: () {}),
                      Container(
                        height: 80.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50.0),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10.0,
                                  color: Colors.black26,
                                  spreadRadius: 5.0)
                            ]),
                        child: Container(
                          child: Center(
                            child: IconButton(
                                icon: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              AssetImage('images/images.png'))),
                                ),
                                onPressed: () {
                                  animationController.reverse();
                                }),
                          ),
                        ),
                      ),
                      FloatingActionButton(
                          child: Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 30.0,
                          ),
                          backgroundColor: Colors.white,
                          onPressed: () {}),
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }
}
