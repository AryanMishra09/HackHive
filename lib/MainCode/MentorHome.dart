import 'package:flutter/material.dart';
import 'package:hackhive/MainCode/MentorUpdate/SessionHistory.dart';
import 'package:hackhive/MainCode/MentorUpdate/UpdateScedule.dart';
import 'package:hackhive/MainCode/MentorUpdate/UpdateSchedulePart2.dart';
import 'package:hackhive/MainCode/MentorUpdate/UpdateSession.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:table_calendar/table_calendar.dart';
import '../style/theme.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'getStarted.dart';

class MentorHome extends StatefulWidget {
  const MentorHome({super.key});

  @override
  State<MentorHome> createState() => _MentorHomeState();
}

class _MentorHomeState extends State<MentorHome> {

  final storage = FlutterSecureStorage();
  String photo='',name='',type='';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fatchData();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Mentor Dashboard'),
            IconButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Logout'),
                      content: Text('Are you sure to logout'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () async {
                            await storage.delete(key: 'Id');
                            await storage.delete(key: 'userType');
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => GetStarted()),
                                  (route) => false, // Removes all routes from the stack
                            );

                          },
                          child: Text('Yes'),
                        ),
                        TextButton(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          child: Text('No'),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.blue.shade50,
                  Colors.blue.shade100,
                  Colors.blue.shade200,
                ]
            )
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 300,
                    child: CircleAvatar(
                      radius: 145,
                      backgroundImage: NetworkImage(photo),
                      backgroundColor: Colors.transparent,
                    )),
              ),
              Center(child: Text('${name}', style: style().vlarge)),
              Center(child: Text(type, style: style().medium)),
              
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateSchedule(),));
                },
                child: Container(
                  height: 60,
                  width: double.maxFinite,
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.only(left: 25,right: 25,top: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                   // border: Border.all(width: 1)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Update Schedule',style: style().small,),
                      Icon(Icons.arrow_forward_ios_outlined)
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateSession(),));
                },
                child: Container(
                  height: 60,
                  width: double.maxFinite,
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.only(left: 25,right: 25,top: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    // border: Border.all(width: 1)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Update Session',style: style().small,),
                      Icon(Icons.arrow_forward_ios_outlined)
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SessionHistory(),));
                },
                child: Container(
                  height: 60,
                  width: double.maxFinite,
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.only(left: 25,right: 25,top: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    // border: Border.all(width: 1)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Session History',style: style().small,),
                      Icon(Icons.arrow_forward_ios_outlined)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40,),


            ],
          ),
        ),
      ),
    );
  }


  Future<void> fatchData() async {
    final id = await storage.read(key: 'Id');
    final url = 'https://hackhive-justcoders.onrender.com/api/mentor/getProfile?id=${id}';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if(response.statusCode == 200){
      print(response.statusCode);
      final result = json.decode(response.body);
      final finalResult = result['mentor'];


      setState(() {
        photo = finalResult['imagepath'];
        name = finalResult['username'];
        type = finalResult['profession'];
      });

      print(result);
      print(finalResult);
      // print(finalResult[0]['id']);
    }else{
      print(response.statusCode);
    }
  }
}
