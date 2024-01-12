import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_project/model/post_model.dart';
import 'package:getx_project/model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final getx = GetConnect();

  Future<List<UserModel>> fetchUserData() async{
    var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if(response.statusCode == 200){
      return userModelFromJson(response.body);
    }
    else {
     throw Exception("Network error");
    }

  }
  
  Future<List<PostModel>> fetchPosts() async {
    
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if(response.statusCode == 200){
      return postModelFromJson(response.body);
    }
    else{
      throw Exception("Network Error");
      // print("Network Error");
    }


  }

  fetchPostedData(String title, String body) async{
    Map<dynamic, dynamic> request = {
      'id': 1,
      'title': title,
      'body': body,
      'userId': 12
    };
        // final response =
  }

  
  
 }