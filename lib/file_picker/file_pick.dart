import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';


class FilePickerWidget extends StatefulWidget {
  @override
  _FilePickerWidgetState createState() => _FilePickerWidgetState();
}

class _FilePickerWidgetState extends State<FilePickerWidget> {


  getFile() async {
    FilePickerResult filePickerResult = await FilePicker.platform.pickFiles();
    if(filePickerResult != null){
      debugPrint(filePickerResult.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
