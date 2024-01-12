import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/Screens/FirebaseDetails.dart';
import 'package:getx_project/Screens/detailScreen.dart';
import 'package:getx_project/controller/firebase_Controller.dart';
class FirebaseScreen extends StatelessWidget {
  FirebaseScreen({super.key});

    FirebaseController _controller = Get.put(FirebaseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Firebase Data'),
      actions: [
        TextButton(onPressed: (){
          _controller.changeToList();
          print(_controller.listView.value);

        }, child: Text('List')),
        TextButton(onPressed: (){
          _controller.changeToGrid();
          print(_controller.listView.value);
        }, child: Text('Grid'))
      ],
      ),

      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx((){
             if (!_controller.listView.value){ return StreamBuilder(
                stream: _controller.PostStream,
                builder: (context,snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator(),);

                  }
                  else if(!snapshot.hasData){
                    return Text("Something went wrong");
                  }

                  return GridView.builder(
                      itemCount: snapshot.data.docs.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // number of items in each row
                        mainAxisSpacing: 8.0, // spacing between rows
                        crossAxisSpacing: 8.0, // spacing between columns
                      ), itemBuilder:(context,index){
                    return Card(
                        child: ListTile(
                            onTap: (){
                              Get.to(FirebaseDetails(title: snapshot.data.docs[index]['title'], body: snapshot.data.docs[index]['body'], id: snapshot.data.docs[index]['id'], ));
                            },
                          subtitle: Text(snapshot.data.docs[index]['title']),));

                  });
                  // return ListView.builder(
                  //     itemCount: snapshot.data!.docs.length,
                  //     itemBuilder: (context, index){
                  //   return Card(
                  //     child: ListTile(
                  //       title: Text(snapshot.data.docs[index]['title']),
                  //       subtitle: Text(snapshot.data.docs[index]['body']),
                  //     ),
                  //   );
                  // });
                });}
         return StreamBuilder(
             stream: _controller.PostStream,
             builder: (context,snapshot){
               if(snapshot.connectionState == ConnectionState.waiting){
                 return Center(child: CircularProgressIndicator(),);

               }
               else if(!snapshot.hasData){
                 return Text("Something went wrong");
               }


               return ListView.builder(
                   itemCount: snapshot.data!.docs.length,
                   itemBuilder: (context, index){
                     return Card(
                       child: ListTile(
                         title: Text(snapshot.data.docs[index]['title']),
                         subtitle: Text(snapshot.data.docs[index]['body']),
                       ),
                     );
                   });
             });
          // return Container();
          })
        ),
      )
    );
  }
}

