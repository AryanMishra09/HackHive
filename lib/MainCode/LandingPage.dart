import 'package:flutter/material.dart';
import 'package:hackhive/MainCode/AllMentors.dart';
import 'package:hackhive/MainCode/HomeOption.dart';

import '../style/theme.dart';
import 'CategoryMentors.dart';
import 'Login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'getStarted.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  final storage = FlutterSecureStorage();

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
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GetStarted()));
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Book Now')
                            ,backgroundColor: Colors.green.shade900,));
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => Signup(),));
                    },
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AllMentors(),));
                      },
                      child: Container(
                          height: 45,
                          width: 200,
                          margin: EdgeInsets.only(left: 20 ),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1,color: Colors.white),
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(40)),

                          child:  Center(child: Text('View All Mentors ➞',style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: 'poppins'),))
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 30,),
              Container(
                  height: 250,
                  child: Center(child: Image.network('https://img.freepik.com/premium-vector/post-traumatic-stress-disorder-shocked-scared-shock-panic-frustrated-fear-depression-concept-illustration_270158-235.jpg?w=740'))),
              SizedBox(height: 10,),
              Center(child: Text('What Symptoms you have!!',style: style().medium,)),
              SizedBox(height: 5,),
              Container(
                  child: Center(child: Icon(Icons.arrow_circle_down_outlined,size: 50,))),

              SizedBox(height: 10,),
              Container(
                width: double.maxFinite,
                height: 332,
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
                          Colors.blue.shade50,
                          Colors.blue.shade100,
                          Colors.blue.shade300,
                          // Colors.blue.shade300,
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'Anxiety',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),

                          Text(
                            '‣ Feeling restless or wound-up\n\n‣ Easily fatigued\n\n‣ Difficulty sleeping (insomnia)\n\n‣ Headaches',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,

                            ),
                          ),

                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AllCategoryMentors(category: 'AnxietyTherapist'),));
                            },
                            child: Text('Book Your Mentor', style: TextStyle(color: Colors.black)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                height: 290,
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
                          Colors.blue.shade50,
                          Colors.blue.shade100,
                          Colors.blue.shade300,
                          // Colors.blue.shade300,
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'Depression',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            '‣ Sadness\n\n‣Fatigue\n\n‣ Hopelessness',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,

                            ),
                          ),

                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AllCategoryMentors(category: 'Psychiatrist'),));
                            },
                            child: Text('Book Your Mentor', style: TextStyle(color: Colors.black)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                height: 290,
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
                          Colors.blue.shade50,
                          Colors.blue.shade100,
                          Colors.blue.shade300,
                          // Colors.blue.shade300,
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'Stress',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            '‣ Anxiety\n\n‣ Irritability\n\n‣ Insomnia',
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
                            child: Text('Book Your Mentor', style: TextStyle(color: Colors.black)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                height: 290,
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
                          Colors.blue.shade50,
                          Colors.blue.shade100,
                          Colors.blue.shade300,
                          // Colors.blue.shade300,
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'Physical fatigue',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),

                          Text(
                            '‣ Restlessness\n\n‣ lack of concentration\n\n‣ Loss of appetite',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,

                            ),
                          ),

                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AllCategoryMentors(category: 'YogaTherapist'),));
                            },
                            child: Text('Book Your Mentor', style: TextStyle(color: Colors.black)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),




              SizedBox(height: 55,),



            ],
          ),
        ),
      ),
    );
  }
}
