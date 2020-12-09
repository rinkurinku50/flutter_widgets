import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_widget_example/getx/model/posts.dart';
import 'package:flutter_widget_example/getx/services/api_constants.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class MyApiClient {
  // static var httpClient = http.Client();
  static var httpClient = Dio();

  static Future getAll() async {
    try {
      // var response = await httpClient.get(ApiConstant.baseurl + 'posts',
      //     headers: {"Content-Type": "application/json"});
      var response = await httpClient.get(
          ApiConstant.baseurl + ApiConstant.posts,
          options: Options(contentType: Headers.jsonContentType));
      if (response.statusCode == 200) {
        print(response.data.map((e) => Posts.fromJson(e)));
        List<Posts> data =
            List<Posts>.from(response.data.map((e) => Posts.fromJson(e)));
        // List<Posts> data = postsFromJson(response.data);
        return data;
      } else {
        // print('Rinku dhiman : ${response.statusCode}');
        // print('Rinku dhiman');
        return 'Rinku dhiman : ${response.statusMessage}';
      }
    } catch (e) {
      // print('Rinku');
      return e.message;
    }
  }
}
