import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/Screens/FirebaseScreen.dart';
import 'package:getx_project/Screens/detailScreen.dart';
import 'package:getx_project/controller/post_controller.dart';
import 'package:getx_project/controller/user_controller.dart';
import 'package:http/http.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  var userController = Get.put(UserController());
  var postController = Get.put(PostController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HomeScreen"),
          actions: [IconButton(onPressed: (){
            Get.to(FirebaseScreen());
          }, icon: Icon(Icons.arrow_forward_ios))],
        ),
        body: Obx(() {
          return ListView.builder(
              itemCount: postController.postList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () {
                      Get.to(DetailsScreen(
                        title: postController.postList[index].title,
                        body: postController.postList[index].body,
                        id: postController.postList[index].id.toString()

                      ));
                    },
                    title: Text(postController.postList[index].title,
                        style:
                            TextStyle(fontSize: 18, color: Colors.deepPurple)),
                    subtitle: Text(
                      postController.postList[index].body,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                );
              });
        }));
  }
}
