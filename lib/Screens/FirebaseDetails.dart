import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/Api/api_service.dart';
import 'package:getx_project/controller/firebase_Controller.dart';
import 'package:getx_project/controller/post_controller.dart';

class FirebaseDetails extends StatelessWidget {
  final String title, body, id;

  FirebaseDetails(
      {super.key,
        required this.title,
        required this.body, required this.id,
      });

  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final _controller = Get.put(FirebaseController());
  @override
  Widget build(BuildContext context) {
    titleController.text = title;
    bodyController.text = body;
    return Scaffold(
      appBar: AppBar(title: Text('Firebase Post'),),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Title",
                style: TextStyle(color: Colors.deepPurple, fontSize: 24),
              ),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),borderSide: BorderSide.none
                    )
                ),
                maxLines: 2,
              ),

              Text(
                "Body",
                style: TextStyle(color: Colors.deepPurple, fontSize: 24),
              ),
              TextFormField(
                controller: bodyController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),borderSide: BorderSide.none
                  ),
                ),maxLines: 8,),

              Spacer(),
              GestureDetector(
                onTap: (){
                  // _controller.updatePost(titleController.text, bodyController.text, id, userId);
                  print('Post updated');
                  _controller.updatePost(titleController.text, bodyController.text, id);
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(18)),
                  child: Center(
                      child: Text(
                        'Update Post',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
