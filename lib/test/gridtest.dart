import 'package:flutter/material.dart';

class TestGrid extends StatefulWidget {
  @override
  _TestGridState createState() => _TestGridState();
}

class _TestGridState extends State<TestGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Test'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            ///Properties of app bar
            backgroundColor: Colors.white,
            floating: false,
            pinned: true,
            bottom: PreferredSize(
              child: Container(
                color: Colors.orange,
              ),
            ),
            expandedHeight: 200.0,
            
            ///Properties of the App Bar when it is expanded
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "SliverGrid Widget",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.black26,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              ///no.of items in the horizontal axis
              crossAxisCount: 4,
              mainAxisSpacing: 12.0,
              crossAxisSpacing: 12.0
            ),
            ///Lazy building of list
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                /// To convert this infinite list to a list with "n" no of items,
                /// uncomment the following line:
                /// if (index > n) return null;
                return listItem(Colors.red, "Sliver Grid item:\n$index");
              },
              /// Set childCount to limit no.of items
              /// childCount: 100,
            ),
          )
        ],
      )
    );
  }
  Widget listItem(Color color, String title) => Container(
    height: 100.0,
    color: color,
    child: Center(
      child: Text(
        "$title",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 10.0,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}
