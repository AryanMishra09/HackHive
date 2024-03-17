import 'package:flutter/material.dart';
import 'package:hackhive/MainCode/ChooseLogin.dart';
import 'package:hackhive/style/theme.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // Align children to stretch horizontally
        children: [
          Center(child: Text('Wellness Warriors',style: TextStyle(
              fontWeight: FontWeight.bold,fontSize: 35
          ),)),
          Expanded(

            child: Container(child: Image.network('https://img.freepik.com/free-vector/young-man-practicing-yoga-exercises-mental-body-health_74855-20437.jpg?t=st=1710647780~exp=1710651380~hmac=50677812638857cbee5a89466ed07e3207ebad726b5af495fc14f64184b11128&w=996')),
          ),
            Center(child: Text('Empower your well being!!!',style: TextStyle(
              fontWeight: FontWeight.normal,fontSize: 20,
            )),
          ),
          Container(
            height: 50,
            margin: EdgeInsets.only(bottom: 80,left: 40,right: 40,top: 40),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => ChooseLogin(),));
              },
              child: Text('Get Started',style:TextStyle(color: Colors.white, fontSize: 20)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade500, // Change button color here
              ),
            ),
          ),
        ],
      ),
    );
  }
}
