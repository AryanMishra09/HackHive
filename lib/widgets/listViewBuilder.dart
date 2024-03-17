import 'package:flutter/material.dart';

class ListViewUI extends StatefulWidget {
  const ListViewUI({super.key});

  @override
  State<ListViewUI> createState() => _ListViewUIState();
}

class _ListViewUIState extends State<ListViewUI> {

  List<dynamic> posts=[];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/avatar.png'),
        ) ,
        title: Text('Main'),
      ),

      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          // final post = posts[index];
          // final title = post.title;
          // final body = post.body;

          return Column(
            children: [
              SizedBox(height: 5,),
              ListTile(
                onTap: (){
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileApi(image,name),));
                },
                tileColor: Colors.grey.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.grey.shade50,
                  //backgroundImage: NetworkImage(image),
                  backgroundImage: AssetImage('assets/images/user.png'),
                ),
                title: Text('title',style: TextStyle(fontWeight: FontWeight.bold,),),
                subtitle: Text('body'),
                trailing: Icon(Icons.add),
              ),
            ],
          );
        },),

    );
  }
}
