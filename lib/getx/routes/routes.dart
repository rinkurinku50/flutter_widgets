import 'package:flutter_widget_example/getx/screens/home.dart';
import 'package:flutter_widget_example/getx/screens/posts.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.HOME, page: () => HomePage()),
    GetPage(name: Routes.POSTS, page: () => PostsPage())
  ];
}

abstract class Routes {
  static const HOME = '/';
  static const POSTS = '/posts';
  static const CADASTRO = '/cadastro';
}
