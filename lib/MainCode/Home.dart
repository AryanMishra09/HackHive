import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackhive/MainCode/AllMentors.dart';
import 'package:hackhive/MainCode/CategoryMentors.dart';
import 'package:hackhive/MainCode/Login.dart';
import 'package:hackhive/MainCode/Model.dart';
import 'package:hackhive/MainCode/getStarted.dart';
import 'package:hackhive/style/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:read_more_text/read_more_text.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'Signup.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final storage = FlutterSecureStorage();

  List<CategoryMentors> categoryMentors = [];

  @override
  void initState() {

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
            Text('Wellness Warrior',style: TextStyle(fontFamily: 'poppins'),),
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

            CircleAvatar(
              radius: 20 ,
              backgroundImage: AssetImage('assets/images/forgot.png'),)
          ],
        ),
      //   leading: CircleAvatar(
      //     radius: 20 ,
      //     backgroundImage: AssetImage('assets/images/avatar.png'),
      // ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Create your account'),
                          backgroundColor: Colors.green.shade900,
                        ),
                      );
                       Navigator.push(context, MaterialPageRoute(builder: (context) => AllMentors(),));
                    },
                    child: Container(
                      height: 45,
                      width: 200,
                      margin: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.white),
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: Text(
                          'Book Now ➞',
                          style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'poppins'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Center(child: Image.asset('assets/images/forgot.png', height: 150)),
              SizedBox(height: 10),
              Center(child: Text('Empower your well being!!!!!', style: style().medium)),
              SizedBox(height: 20),
              Container(
                width: double.maxFinite,
                height: 300,
                child: Card(
                  elevation: 1,
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Container(
                    width: 200, // Set a fixed width for each item in the horizontal ListView
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white,
                          Colors.blue.shade50,
                          Colors.blue.shade100,
                          Colors.blue.shade100,
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Stress Management Therapist',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Description:-',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            'Helping you in relieve stress from your life and maintaining a happy life',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,

                            ),
                          ),

                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AllCategoryMentors(category: 'StressManagementTherapist'),));
                            },
                            child: Text('View All Mentor', style: TextStyle(color: Colors.black)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                height: 270,
                child: Card(
                  elevation: 1,
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Container(
                    width: 200, // Set a fixed width for each item in the horizontal ListView
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.blue.shade100,
                          Colors.blue.shade300,
                          Colors.blue.shade400,
                          Colors.blue.shade700,
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Yoga Therapist',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Description:- ',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            'Motivating you to keep your everyday routine energetic, productive by the realm of yogic practices',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,

                            ),
                          ),

                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AllCategoryMentors(category: 'YogaTherapist',),));
                            },
                            child: Text('View All Mentor', style: TextStyle(color: Colors.black)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                height: 270,
                child: Card(
                  elevation: 1,
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Container(
                    width: 200, // Set a fixed width for each item in the horizontal ListView
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.blue.shade100,
                          Colors.blue.shade300,
                          Colors.blue.shade400,
                          Colors.blue.shade700,
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Anxiety Therapist',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Description:-',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            'Overcome the dark world of anxiety by our regular and proficient therapies.',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,

                            ),
                          ),

                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AllCategoryMentors(category: 'AnxietyTherapist',),));
                            },
                            child: Text('View All Mentor', style: TextStyle(color: Colors.black)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                height: 270,
                child: Card(
                  elevation: 1,
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Container(
                    width: 200, // Set a fixed width for each item in the horizontal ListView
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.blue.shade100,
                          Colors.blue.shade300,
                          Colors.blue.shade400,
                          Colors.blue.shade700,
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Psychiatrist',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Description:-',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            'Its not a taboo!! Its a genuine medical disease!! Lets cure it and show our hidden self yet again',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,

                            ),
                          ),

                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AllCategoryMentors(category: 'Psychiatrist',),));
                            },
                            child: Text('View All Mentor', style: TextStyle(color: Colors.black)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,)
            ],
          ),
        ),
      )

    );
  }

  Future<void> fatchData() async {
    final url = 'https://hackhive-justcoders.onrender.com/api/user/getMentorListCategorywise?profession=YogaTherapist';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if(response.statusCode == 200){
      print(response.statusCode);
      final result = json.decode(response.body);
      final finalResult = result['mentor_category'] as List<dynamic>;

      setState(() {
        categoryMentors = finalResult.map((e) {
          return CategoryMentors(name: e['username'], profession: e['profession'], qualification: e['qualification'], charges: e['chargesph'],id: e['_id']);
        }).toList();
      });

      print(result);
      print(finalResult);
      // print(finalResult[0]['id']);
    }else{
      print(response.statusCode);
    }
  }

}
