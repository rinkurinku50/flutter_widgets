import 'dart:io';

import 'package:ext_storage/ext_storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class GetAllImage extends StatefulWidget {
  @override
  _GetAllImageState createState() => _GetAllImageState();
}

class _GetAllImageState extends State<GetAllImage> {
  List<dynamic> lisImagePath=List<dynamic>();
  getImage() async {
    // var path = await getExternalStorageDirectory();
    // paths.then((value) => print(value));
    // Directory mainDi = path.parent.parent.parent.parent;
    List<dynamic> listImage = List<dynamic>();
    ExtStorage.getExternalStoragePublicDirectory(ExtStorage.DIRECTORY_DCIM).then((value) {
      Directory mainDi=Directory(value);
      mainDi.list().forEach((element) {
        if(element.runtimeType.toString().toLowerCase() == '_File'.toLowerCase()) {
          RegExp exp =
          RegExp(r"\.(?:jpg|gif|png)");
          if(exp.hasMatch('$element')){
            // print(element);
            listImage.add(element);
            setState(() {
              lisImagePath = listImage;
            });
          }

        }

      });
    });
    // print(pat);
    // List<dynamic> listImage = List<dynamic>();

  }

  _fetchFiles(Directory dir) {
    List<dynamic> listImage = List<dynamic>();
    dir.list().forEach((element) {
      RegExp regExp =
          new RegExp("\.(gif|jpe?g|tiff?|png|webp|bmp)", caseSensitive: false);
      // Only add in List if path is an image
      if (regExp.hasMatch('$element')) listImage.add(element);
      // setState(() {
      //   listImagePath = listImage;
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 250.0,
              color: Colors.orangeAccent,
            ),
            SizedBox(
              height: 25.0,
            ),
            MaterialButton(
              padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 15.0),
              shape: Border(
                bottom: BorderSide(
                    color: Colors.orange[900],
                    width: 5.0,
                    style: BorderStyle.solid),
              ),
              color: Colors.orangeAccent,
              onPressed: () {
                getImage();
              },
              child: Text('Get'),
            ),
            Expanded(child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                crossAxisCount: 2
              ),
                itemCount: lisImagePath.length,
                itemBuilder: (context, index) {
                return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                          spreadRadius: 1.0,
                          offset: Offset(1,1)
                        )
                      ],
                      image: DecorationImage(
                        image: FileImage(lisImagePath[index]),
                        fit: BoxFit.cover
                      )
                    ));
              },),
            ))
          ],
        ),
      ),
    );
  }
}
