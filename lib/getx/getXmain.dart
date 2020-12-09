import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_example/getx/controller/postsController.dart';
import 'package:flutter_widget_example/getx/controller/usercontroller.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snack.dart';

import 'model/model.dart';

class GetXMain extends StatelessWidget {
  var userCon = Get.put(UserController());
  var postCon = Get.put(PostsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: userCon.scstate.value,
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: GetX<PostsController>(
                  builder: (controller) {
                    if (controller.isError != '') {
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        // showDialog(context);
                        Get.defaultDialog(
                          barrierDismissible: false,
                          cancel: RaisedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancel'),
                          ),
                          title: 'Error',
                        );
                        controller.isError = '';
                      });
                    }

                    return controller.isLoading == true
                        ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            itemCount: controller.postData.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  // controller.deleteUser(index);
                                },
                                child: Card(
                                  elevation: 2.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                        Text(controller.postData[index].title),
                                  ),
                                ),
                              );
                            },
                          );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GetBuilder<PostsController>(builder: (controller) {
                      return GestureDetector(
                        onTap: () {
                          controller.getAllPosts();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 45.0),
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(16.0)),
                          child: Text(
                            'ReCall',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    })
                  ],
                ),
              )
              // Expanded(
              //   child: GetBuilder<PostsController>(builder: (controller) {
              //     return Column(
              //       children: [
              //         Center(
              //           child: RaisedButton(
              //             onPressed: () {
              //               controller.getAllPosts();
              //               // controller.addUser(User(
              //               //     id: 9, name: 'robin', email: 'robin@gmail.com'));
              //             },
              //             child: Text('ReCall'),
              //           ),
              //         ),
              //         Center(
              //           child: RaisedButton(
              //             onPressed: () {
              //               // _showBottomSheet(controller.scstate.value.currentState);
              //               showModalBottomSheet(
              //                 shape: RoundedRectangleBorder(
              //                     side: BorderSide(
              //                         width: 1.0, color: Color(0xFF737373)),
              //                     borderRadius: BorderRadius.only(
              //                         topLeft: const Radius.circular(25.0),
              //                         topRight: const Radius.circular(25.0))),
              //                 isScrollControlled: true,
              //                 context: context,
              //                 builder: (context) {
              //                   return Container(
              //                     height: 350.0,
              //                     color: Colors
              //                         .transparent, //could change this to Color(0xFF737373),
              //                     //so you don't have to change MaterialApp canvasColor
              //                     child: new Container(
              //                         decoration: new BoxDecoration(
              //                             color: Colors.white,
              //                             borderRadius: new BorderRadius.only(
              //                                 topLeft:
              //                                     const Radius.circular(25.0),
              //                                 topRight:
              //                                     const Radius.circular(25.0))),
              //                         child: new Container(
              //                           padding: EdgeInsets.all(8.0),
              //                           child: GetX<PostsController>(
              //                             initState: (state) {},
              //                             builder: (controller) {
              //                               print(controller.postData);
              //                               return controller.isLoading == true
              //                                   ? Center(
              //                                       child:
              //                                           CircularProgressIndicator())
              //                                   : ListView.builder(
              //                                       itemCount: controller
              //                                           .postData.length,
              //                                       itemBuilder:
              //                                           (context, index) {
              //                                         return GestureDetector(
              //                                           onTap: () {
              //                                             // controller.deleteUser(index);
              //                                           },
              //                                           child: Card(
              //                                             elevation: 2.0,
              //                                             child: Padding(
              //                                               padding:
              //                                                   const EdgeInsets
              //                                                       .all(8.0),
              //                                               child: Text(controller
              //                                                   .postData[index]
              //                                                   .title),
              //                                             ),
              //                                           ),
              //                                         );
              //                                       },
              //                                     );
              //                             },
              //                           ),
              //                         )),
              //                   );
              //                 },
              //               );
              //             },
              //             child: Text('Dailog'),
              //           ),
              //         ),
              //       ],
              //     );
              //   }),
              // )
            ],
          ),
        ),
      ),
    );
  }

  void showDialog(BuildContext context) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 300,
            child: SizedBox.expand(child: FlutterLogo()),
            margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }

  void _showBottomSheet(ScaffoldState scaffoldState) {
    scaffoldState.showBottomSheet((BuildContext context) {
      return Container(
        height: 350.0,
        color: Colors.transparent, //could change this to Color(0xFF737373),
        //so you don't have to change MaterialApp canvasColor
        child: new Container(
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(25.0),
                    topRight: const Radius.circular(25.0))),
            child: new Center(
              child: new Text("This is a modal sheet"),
            )),
      );
    });
  }
}
