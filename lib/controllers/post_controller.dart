import 'package:get/state_manager.dart';
import 'package:getx_app/models/post.dart';
import 'package:getx_app/services/api_service.dart';

class PostController extends GetxController {
  var isLoading = true.obs;
  var postList = <Post>[].obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      var posts = await ApiService.fetchPosts();
      if (posts != null) {
        postList.value = posts;
      }
    } finally {
      isLoading(false);
    }
  }
}
