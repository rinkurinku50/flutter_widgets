import 'package:flutter/material.dart';
import 'package:flutter_widget_example/sqlLiteWithOffline/model/Album.dart';

class AlbumCell extends StatelessWidget {
  final Album album;
  final Function deleteFunction;
  final Function updateFunction;

  AlbumCell(this.album, this.deleteFunction, this.updateFunction);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(0.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(album.url), fit: BoxFit.cover),
          ),
          alignment: Alignment.bottomCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  '${album.title}',
                  maxLines: 1,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  '${album.id}',
                  maxLines: 1,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    color: Colors.green,
                    child: Text(
                      'Update',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    onPressed: () {
                      album.title = '${album.id} Updated';
                      updateFunction(album);
                    },
                  ),
                  RaisedButton(
                    color: Colors.red,
                    child: Text(
                      'Delete',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    onPressed: () {
                      deleteFunction(album.id);
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
