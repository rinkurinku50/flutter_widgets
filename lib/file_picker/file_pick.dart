import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePickerWidget extends StatefulWidget {
  @override
  _FilePickerWidgetState createState() => _FilePickerWidgetState();
}

class _FilePickerWidgetState extends State<FilePickerWidget> {
  File _imagefile;
  bool isLoad = true;
  bool isVis = false;

  getFile() async {
    FilePickerResult filePickerResult = await FilePicker.platform.pickFiles();
    if (filePickerResult != null) {
      // setState(() {
      //   isVis = true;
      // });
      // filePickerResult.names.map((e) => print('Rinku $e'));
      print('Rinku Dhiman ${filePickerResult.count}');
      List<String> name = filePickerResult.names.map((e) => e).toList();
      List<String> path = filePickerResult.paths.map((e) => e).toList();
      PlatformFile mainFile = filePickerResult.files.map((e) => e).single;

      List<File> files = filePickerResult.paths.map((e) => File(e)).toList();

      File file = File(filePickerResult.files.single.path);

      Future<Uint8List> _readFile =
          new File(filePickerResult.files.single.path).readAsBytes();

      _readFile.then((value) => print(value));

      // Stream<List<int>> _data = file.openRead();
      // _data.transform(utf8.decoder).transform(new LineSplitter()).listen(
      //     (line) {
      //   print('$line: ${line.length} bytesRinku');
      // }, onDone: () {
      //   print('File is now closed.');
      // }, onError: (e) {
      //   print(e.toString());
      // });
      // setState(() {
      //   _imagefile = file;
      //   isLoad = false;
      // });
      print('Rinku Dhiman ${file}');

      // file.uri

      // Stream<List<int>> _data = file.openRead();
      // _data.transform(utf8.decoder).transform(new LineSplitter()).listen(
      //     (line) {
      //   print('$line: ${line.length} bytes');
      // }, onDone: () {
      //   print('File is now closed.');
      // }, onError: (e) {
      //   print(e.toString());
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 250.0,
              color: Colors.orange,
            ),
            Visibility(
                maintainState: true,
                maintainSize: true,
                maintainAnimation: true,
                visible: isVis,
                child: isLoad
                    ? CircularProgressIndicator()
                    : Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.width,
                        child: Image.file(
                          _imagefile,
                          fit: BoxFit.fill,
                        ),
                      ))
          ],
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          getFile();
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
          width: 120.0,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black45,
                    blurRadius: 10.0,
                    spreadRadius: 1.0,
                    offset: Offset(1, 1))
              ],
              borderRadius: BorderRadius.circular(25.0)),
          child: Row(
            children: [
              SizedBox(
                width: 12.0,
              ),
              Icon(
                Icons.file_copy,
                color: Colors.red[900],
              ),
              SizedBox(
                width: 12.0,
              ),
              Text(
                'Picker',
                style: TextStyle(fontSize: 17.0, color: Colors.red[900]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
