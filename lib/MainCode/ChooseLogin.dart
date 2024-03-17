import 'package:flutter/material.dart';
import 'package:hackhive/MainCode/Login.dart';
import 'package:hackhive/MainCode/mentorLogin.dart';

import '../style/theme.dart';

class ChooseLogin extends StatefulWidget {
  const ChooseLogin({super.key});

  @override
  State<ChooseLogin> createState() => _ChooseLoginState();
}

class _ChooseLoginState extends State<ChooseLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(

        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.blue.shade400,
                ]
            )
        ),

        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch, // Align children to stretch horizontally
            children: [
              Center(child: Text('Choose Login',style: TextStyle(
                  fontWeight: FontWeight.bold,fontSize: 35,fontFamily: 'poppins'
              ),)),
              Container(
                height: 350,
                  child: Image.network('https://img.freepik.com/premium-vector/man-with-red-jacket-white-shirt-is-standing-front-wall-with-icons-like-graphs-graphs_118167-66.jpg?w=740')),
              Container(
                height: 50,
                margin: EdgeInsets.only(left: 20,right: 20 ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => LoginScreen(),));
                  },
                  child: Text('As User',style: TextStyle(
                     fontSize: 22,color: Colors.white
                      ,fontFamily: 'poppins'),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade500, // Change button color here
                  ),
                ),
              ),
              Container(
                height: 50,
                margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 50),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => MentorLogin(),));
                  },
                  child: Text('As Mentor',style: TextStyle(
                      fontSize: 20,color: Colors.white
                  ,fontFamily: 'poppins'),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade500, // Change button color here
                  ),
                ),
              ),
            ],
          ),
      ),

    );
  }
}
