import 'package:flutter/material.dart';
import 'package:flutter_widget_example/sqlLiteWithOffline/model/Album.dart';
import 'package:flutter_widget_example/sqlLiteWithOffline/model/Albums.dart';
import 'package:flutter_widget_example/sqlLiteWithOffline/services/DbHelper.dart';
import 'package:flutter_widget_example/sqlLiteWithOffline/services/services.dart';
import 'package:flutter_widget_example/sqlLiteWithOffline/ui/AlbumCell.dart';

class GridViewDemo extends StatefulWidget {
  final String title = 'Photos';
  @override
  _GridViewDemoState createState() => _GridViewDemoState();
}

class _GridViewDemoState extends State<GridViewDemo> {
  int counter;
  static Albums albums;
  DbHelper hepler;
  bool albumsLoaded;
  String title;
  double percent;
  GlobalKey<ScaffoldState> _scaffoldState;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    counter = 0;
    percent = 0.0;
    albumsLoaded = false;
    title = widget.title;
    hepler = DbHelper();
    _scaffoldState = GlobalKey();
  }

  getPhotos() {
    setState(() {
      counter = 0;
      albumsLoaded = false;
    });
    Services.getPhotos().then((value) {
      albums = value;
      hepler.truncateTable().then((val) {
        insert(value.albums[0]);
      });
    });
  }

  insert(Album album) {
    //print(album.thumbnailUrl);
    //hepler.save(album);
    hepler.save(album).then((val) {
      counter = counter + 1;
      percent = ((counter / albums.albums.length) * 100) / 100;
      if (counter >= albums.albums.length) {
        // when insert is done
        setState(() {
          albumsLoaded = true;
          percent = 0.0;
          title = '${widget.title} [$counter]';
        });
        return;
      }

      setState(() {
        title = 'Inserting....$counter';
      });

      Album a = albums.albums[counter];
      insert(a);
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(Services.getPhotos());
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: Icon(Icons.file_download),
            onPressed: () {
              getPhotos();
            },
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          albumsLoaded
              ? Flexible(
                  child: FutureBuilder(
                  future: hepler.getAlbums(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error ${snapshot.error}');
                    }
                    if (snapshot.hasData) {
                      return gridview(snapshot);
                    }
                    return Container(child: Text('Loading...'));
                  },
                ))
              : LinearProgressIndicator(
                  value: percent,
                )
        ],
      ),
    );
  }

  Widget gridview(AsyncSnapshot<Albums> snapshot) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: snapshot.data.albums.map((album) {
          return GridTile(child: AlbumCell(album, delete, update));
        }).toList(),
      ),
    );
  }

  update(Album album) {
    hepler.update(album).then((updateVal) {
      //
      showSnackBar('Updated ${album.id}');
      refresh();
    });
  }

  delete(int id) {
    hepler.delete(id).then((delVal) {
      //
      showSnackBar('Deleted $id');
      refresh();
    });
  }

  //method to refresh the list after the db operations

  refresh() {
    hepler.getAlbums().then((allalbums) {
      setState(() {
        albums = allalbums;
        counter = allalbums.albums.length;
        title = '${widget.title} [$counter]';
      });
    });
  }

  //snackbar
  showSnackBar(String message) {
    _scaffoldState.currentState.showSnackBar(SnackBar(content: Text(message)));
  }
}
