import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScrollEvent extends StatefulWidget {
  @override
  _ScrollEventState createState() => _ScrollEventState();
}

class _ScrollEventState extends State<ScrollEvent> {
  ScrollController _scroll;
  GlobalKey<ScaffoldState> _scaffoldState=GlobalKey<ScaffoldState>();
  String updateNoti='';
  bool checkVis=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scroll =ScrollController();
    _scroll.addListener(_scrollListner);
  }

  _scrollListner() {

    print(_scroll.position.maxScrollExtent);
    // setState(() {
    //
    //   updateNoti = _scroll.offset.round().toString();
    // });
    if (_scroll.offset >= _scroll.position.maxScrollExtent &&
        !_scroll.position.outOfRange) {
      _scaffoldState.currentState.showSnackBar(SnackBar(
        content: Text("Reach at Bottom"),
      ));

    }
    if (_scroll.offset <= _scroll.position.minScrollExtent  &&
        !_scroll.position.outOfRange) {
      _scaffoldState.currentState.showSnackBar(SnackBar(
        content: Text("Reach at Top"),
      ));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: Text('ScrollEvent'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.green
              ),
              child: Text(updateNoti,style: TextStyle(fontSize: 20.0),),
            ),
            Expanded(
              child: Stack(
                children: [
                  NotificationListener<ScrollNotification>(
                    onNotification: (scrollNotification) {
                      if (scrollNotification is ScrollStartNotification) {
                        // _onStartScroll(scrollNotification.metrics);
                        setState(() {
                          updateNoti='Scroll Start';
                        });
                      } else if (scrollNotification is ScrollUpdateNotification) {
                        // _onUpdateScroll(scrollNotification.metrics);
                        setState(() {
                          // updateNoti='Scroll Update';
                           updateNoti = scrollNotification.metrics.pixels.toString();
                           if(scrollNotification.metrics.pixels >=  250.0){
                             setState(() {
                               checkVis=true;
                             });
                           } else{
                             checkVis=false;
                           }
                        });
                      } else if (scrollNotification is ScrollEndNotification) {
                        // _onEndScroll(scrollNotification.metrics);
                        setState(() {
                          updateNoti='Scroll End';
                        });
                      }
                    },
                    child: ListView.builder(
                      controller: _scroll,
                      itemCount: 30,
                      itemBuilder: (context, index) {
                       return Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Material(
                             elevation: 2.0,
                           child: ListTile(
                             title: Container(
                               child: Text((index+1).toString()),
                             ),
                           )
                         ),
                       );
                    },),
                  ),
                  Positioned(
                    bottom: 50.0,
                    right: 25.0,
                    child: Visibility(
                      maintainAnimation: true,
                      maintainSize: true,
                      maintainState: true,
                      visible: checkVis,
                      child: TranslationAnimatedWidget(
                        curve: Curves.bounceInOut,
                        duration: Duration(milliseconds: 1000),
                        enabled: checkVis,
                        values: [
                          Offset(0.0, 180.0),
                          Offset(0.0, 150.0),
                          Offset(0.0, 0.0),
                        ],
                        child: GestureDetector(
                          onTap: () {
                            _scroll.animateTo(0.0, duration: Duration(seconds: 1), curve: Curves.linear);
                          },
                          child: Container(
                            width: 65.0,
                            height: 65.0,
                            decoration: BoxDecoration(
                            color: Colors.orange,
                              borderRadius: BorderRadius.circular(15.0)

                            ),
                            child: Icon(Icons.arrow_upward, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

