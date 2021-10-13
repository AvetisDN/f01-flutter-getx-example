import 'package:http/http.dart' as http;
import 'package:getx_app/models/post.dart';

class ApiService {
  static var client = http.Client();

  static Future<List<Post>?> fetchPosts() async {
    var response = await client
        .get(Uri.parse('http://10.1.100.109:1337/posts?_sort=updated_at:DESC'));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return postsFromJson(jsonString);
    } else {
      return null;
    }
  }
}
