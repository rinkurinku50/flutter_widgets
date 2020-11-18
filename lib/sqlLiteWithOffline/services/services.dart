import 'dart:convert';

import 'package:flutter_widget_example/sqlLiteWithOffline/model/Album.dart';
import 'package:flutter_widget_example/sqlLiteWithOffline/model/Albums.dart';
import 'package:http/http.dart' as http;

class Services {
  static List<Album> albums;
  static const String url = 'https://jsonplaceholder.typicode.com/photos';

  static Future<Albums> getPhotos() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        String data = response.body;
        final parsed = json.decode(data);
        List<Album> list =
            parsed.map<Album>((json) => Album.fromJson(json)).toList();
        Albums al = Albums();
        al.albums = list;
        return al;
        //List<Album> al = parsed.map();
      } else {
        return Albums();
      }
    } catch (e) {
      return Albums();
    }
  }
}
