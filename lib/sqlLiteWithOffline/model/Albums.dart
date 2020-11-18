import 'package:flutter_widget_example/sqlLiteWithOffline/model/Album.dart';

class Albums {
  Albums({
    this.albums,
  });

  List<Album> albums;

  factory Albums.fromJson(Map<String, dynamic> json) => Albums(
        albums: List<Album>.from(json["albums"].map((x) => Album.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "albums": List<dynamic>.from(albums.map((x) => x.toJson())),
      };
}
