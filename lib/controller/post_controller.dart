import 'package:get/get.dart';
import 'package:getx_project/Api/api_service.dart';
import 'package:getx_project/model/post_model.dart';
import 'package:getx_project/model/user_model.dart';
import 'package:http/http.dart' as http;
class PostController extends GetxController{
  var postList = <PostModel>[].obs;

// var postList = <PostModel>[].obs;
  fetchPosts() async{
    try {
      var posts = await ApiService().fetchPosts();
      postList.addAll(posts);
    }catch(e){
      print('Something went wrong $e');
    }
  }
  
    updatePost(String title, String body, int id, int userId) async{
      Map<dynamic, dynamic> request = {
        'id': id,
        'title': title,
        'body': body,
        'userId': userId
      };
      print(request);
      final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
      final response = await http.put(uri,body: request);
      if(response.statusCode == 200){
        print(request);
      //   // print(object)
      }
      else{
        throw Exception('Failed to post');
      }
    
    
    
    }
  
@override
  void onInit() {
    fetchPosts();

    // TODO: implement onInit
    super.onInit();
  }
}

