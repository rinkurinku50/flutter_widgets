import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stack Widget")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: Colors.indigoAccent,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                Container(
                    child: Positioned(
                  right: 50.0,
                  bottom: 50.0,
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('images/ironman.jpg'),
                            fit: BoxFit.cover),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 30.0,
                              spreadRadius: 1,
                              offset: Offset(10.0, 10.0))
                        ]),
                  ),
                )),
                Container(
                  padding: EdgeInsets.only(left: 15.0, top: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "What to do",
                        style: TextStyle(fontSize: 24.0, color: Colors.white),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "If your are sick",
                        style: TextStyle(fontSize: 24.0, color: Colors.white),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Container(
                        height: 40.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.yellow),
                        child: Center(
                          child: RichText(
                              text: TextSpan(
                                  text: 'Learn More',
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                WidgetSpan(
                                    child: Icon(Icons.arrow_forward),
                                    alignment: PlaceholderAlignment.middle)
                              ])),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
