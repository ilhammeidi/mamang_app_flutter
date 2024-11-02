import 'package:get/get.dart';
import 'package:mamang_app_flutter/models/post.dart';

class PostController extends GetxController {
  final rawData = postList;

  var allPost = <Post>[].obs;
  var selectedPost = Post().obs;
  var isNotFound = false.obs;

  @override
  void onInit() {
    fetchPost();
    super.onInit();
  }

  void fetchPost() async {
    allPost.addAll(rawData);
    update();
  }

  void getPost(String id) {
    Post result = allPost.firstWhere((item) => item.id == id, orElse: () => Post());

    if (result.id == '0') {
      isNotFound.value = true;
    } else {
      isNotFound.value = false;
      selectedPost.update((postVal) {
        postVal!.id = result.id;
        postVal.userId = result.userId;
        postVal.caption = result.caption;
        postVal.image = result.image;
        postVal.location = result.location;
        postVal.likes = result.likes;
        postVal.comments = result.comments;
        postVal.views = result.views;
        postVal.duration = result.duration;
        postVal.timeFrom = result.timeFrom;
        postVal.timeTo = result.timeTo;
      });
    }
  }
}