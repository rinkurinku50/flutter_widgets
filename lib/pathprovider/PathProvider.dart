import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class PathPro extends StatefulWidget {
  @override
  _PathProState createState() => _PathProState();
}

class _PathProState extends State<PathPro> {
  bool check = false;
  bool checkBox = false;
  bool cardTest = false;

  var _scaffold = GlobalKey<ScaffoldState>();

  var _controllerPath = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //getPermissioin();
  }

  @override
  Widget build(BuildContext context) {
    getPermissioin(Permission.storage).then((value) => {
          if (value)
            {
              setState(() {
                check = value;
              })
            }
        });

    return Scaffold(
      key: _scaffold,
      appBar: AppBar(
        title: Text('PathProvider'),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: check == true ? Colors.green : Colors.red),
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      check == true
                          ? Text('Permission Granted')
                          : Text("Permission Denied"),
                    ],
                  ),
                  RaisedButton(
                    child: Text("Get Permission..."),
                    onPressed: check
                        ? null
                        : () {
                            getPermissioin(Permission.storage).then((value) => {
                                  if (value)
                                    {
                                      setState(() {
                                        check = value;
                                      })
                                    }
                                });
                          },
                  )
                ],
              ),
              SizedBox(
                height: 12.0,
              ),
              Row(
                children: [
                  Checkbox(
                    value: checkBox,
                    onChanged: (value) {
                      setState(() {
                        checkBox = value;
                      });
                    },
                  ),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.0),
                    height: 40.0,
                    child: TextField(
                      enabled: checkBox,
                      controller: _controllerPath,
                      decoration: InputDecoration(
                        labelText: 'Folder Name',
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1.0),
                        ),
                      ),
                    ),
                  )),
                  Container(
                    height: 40.0,
                    child: RaisedButton(
                      child: Text("Create"),
                      onPressed: checkBox
                          ? () {
                              print(_controllerPath.text);
                            }
                          : null,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    cardTest = !cardTest;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(8.0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: cardTest
                      ? BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 2.0))
                      : null,
                  child: Material(
                    elevation: 5.0,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.card_membership),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "For Myself",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "Write Better think more clearly.",
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "Free for 1 Person",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                          cardTest
                              ? Container(
                                  width: 24.0,
                                  height: 24.0,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 16.0,
                                  ),
                                )
                              : Container(
                                  width: 24.0,
                                  height: 24.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.black38),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              //RaisedButton(
              //  child: Text('Storage'),
              //  onPressed: () async {
              //    var applicationDir = await getExternalStorageDirectory();
              //    String dir = applicationDir.parent.parent.parent.parent.path;
              //    //print(dir);
              //    Directory checkDir = Directory('$dir/Rajan');
              //    if (checkDir.existsSync()) {
              //      print("Already created...");
              //      print(checkDir.path);
              //      File txt = File('${checkDir.path}/data.txt');

              //      if (txt.existsSync()) {
              //        String readdata = await txt.readAsString();
              //        print(readdata);
              //        return;
              //      }

              //      File result =
              //          await txt.writeAsString("My name is Rinku...");

              //      //File readFi = File('${checkDir.path}/data.txt');

              //    } else {
              //      var newDir = await new Directory('$dir/Rajan').create();
              //      print(newDir);
              //      //File txt = File('$newDir/data.txt');
              //      //File result =
              //      //    await txt.writeAsString("My name is Rinku...");
              //    }

              //    //print(applicationDir.parent.parent.path);
              //  },
              //)
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> getPermissioin(Permission permission) async {
    var status = await permission.request();
    if (status.isUndetermined) {
      return false;
    } else if (status.isDenied) {
      return false;
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
      return false;
    } else if (status.isGranted) {
      return true;
    }
    return false;
  }

  Future<Map<Permission, PermissionStatus>> multiplePermissions(
      List<Permission> list) async {
    return await list.request();
  }
}
