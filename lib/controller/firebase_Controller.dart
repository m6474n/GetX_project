import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:getx_project/Screens/FirebaseScreen.dart';

class FirebaseController extends GetxController{
  final listView = true.obs;

  Stream PostStream = FirebaseFirestore.instance.collection('posts').snapshots();

  changeToList(){
    listView(true);
  }
  changeToGrid(){
    listView(false);
  }
  addPost(String title, String body, String id)async{

    FirebaseFirestore.instance.collection("posts").doc(id).set({
      'id':id,
      'title':  title,
      'body': body,
    }).then((value){
      Get.to(FirebaseScreen());
      print('Post Added Successfully');
    });
  }
updatePost(String title, String body, String id){
    FirebaseFirestore.instance.collection('posts').doc(id).update({
      'title': title,
      'body':body
    }).then((value){
      Get.back();
      print('Post Updated Successfully');
    });
}
  
  
@override
  void onInit() {
    // TODO: implement onInit
  super.onInit();
  }
}