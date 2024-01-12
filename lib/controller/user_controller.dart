import 'package:get/get.dart';
import 'package:getx_project/Api/api_service.dart';
import 'package:getx_project/model/user_model.dart';

class UserController extends GetxController{
  var usersList = <UserModel>[].obs;


fetchUserData() async{
  try {
    var userData = await ApiService().fetchUserData();
    usersList.addAll(userData);
  }
  catch(e){
    print("Error fetching data from users $e" );
  }
}

@override
  void onInit() {
    // TODO: implement onInit

    fetchUserData();


  super.onInit();
  }
}