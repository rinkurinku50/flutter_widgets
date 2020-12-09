import 'package:dio/dio.dart';
import 'package:flutter_widget_example/getx/model/posts.dart';
import 'package:flutter_widget_example/getx/services/api_provider.dart';
import 'package:get/get.dart';

class PostsController extends GetxController {
  var postData = List<Posts>().obs;
  var isLoading = false.obs;
  var isError = '';
  // var da = null;
  @override
  void onInit() {
    super.onInit();
    getAllPosts();
  }

  getAllPosts() async {
    isLoading(true);
    try {
      var listData = await MyApiClient.getAll();
      // print('Rinku :${listData}');

      if (listData is List<Posts>) {
        postData.assignAll(listData);
      } else {
        isError = listData;
        update();
      }

      isLoading(false);
    } catch (e) {
      isError = e.message;
      isLoading(false);
    }
  }

  showDial() {
    Get.defaultDialog();
  }
}
