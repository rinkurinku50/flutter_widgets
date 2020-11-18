import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_example/widgets/stack.dart';

class GridWidgetCount extends StatelessWidget {
  List<String> images = [
    "https://placeimg.com/500/500/any",
    "https://placeimg.com/500/500/any",
    "https://placeimg.com/500/500/any",
    "https://placeimg.com/500/500/any",
    "https://placeimg.com/500/500/any"
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("codesundar.com"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
          padding: EdgeInsets.all(16.0),
          child: GridView.extent(
            maxCrossAxisExtent: 50,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            padding: EdgeInsets.all(20.0),
            children: <Widget>[
              Container(
                child: Material(
                  elevation: 10.0,
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                      alignment: Alignment.center, child: Text("Hello")),
                ),
              ),
              Container(
                child: Material(
                  elevation: 10.0,
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                      alignment: Alignment.center, child: Text("Hello")),
                ),
              ),
              Container(
                child: Material(
                  elevation: 10.0,
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                      alignment: Alignment.center, child: Text("Hello")),
                ),
              ),
            ],
          )),
    );
  }
}

class GridWidgetBuilder extends StatelessWidget {
  List<String> images = [
    "https://placeimg.com/500/500/any",
    "https://placeimg.com/500/500/any",
    "https://placeimg.com/500/500/any",
    "https://placeimg.com/500/500/any",
    "https://placeimg.com/500/500/any"
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("codesundar.com"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
          padding: EdgeInsets.all(16.0),
          child: GridView.builder(
            itemCount: images.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0),
            itemBuilder: (BuildContext context, int index) {
              return Image.network(images[index]);
            },
          )),
    );
  }
}

class SimpleGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView'),
      ),
      body: Container(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [myItem(context), myItem(context), myItem(context)],
        ),
      ),
    );
  }

  Widget myItem(context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
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
    );
  }
}
