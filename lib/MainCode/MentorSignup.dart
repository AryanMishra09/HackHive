import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackhive/MainCode/Login.dart';
import 'package:hackhive/MainCode/MentorVerify.dart';
import 'package:hackhive/MainCode/VerifyOTP.dart';
import 'package:hackhive/MainCode/mentorLogin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MentorSignup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MentorSignupState();
}

class _MentorSignupState extends State<MentorSignup> {

  String email='',password='',CPassword='',userName='',qualification='',about='',chargesph='';
  String profession = 'Stress Management Therapist';




  // List of items in our dropdown menu
  var items = [
    'Stress Management Therapist',
    'Yoga Therapist',
    'Anxiety Therapist',
    'Psychiatrist',
  ];

  @override
  Widget build(BuildContext context) {


    List<String> _locations = ['Mits Gwalior', 'IIT Bombay', 'IIT Kanpur', 'Mit Madras']; // Option 2
    String _selectedLocation;

    return Scaffold(
      appBar: AppBar(
        title: Text("", style: TextStyle(color: Colors.black),),
        backgroundColor:  Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),

      backgroundColor: Color(0xFFEEEFF9),

      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.white,
                    Colors.blue.shade100,
                    Colors.blue.shade200,
                  ]
              )
          ),

          child: SingleChildScrollView(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Container(
                            child: Text(
                              'Create Account',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Poppins',
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Container(
                    height: 200,
                    child: Image.network('https://img.freepik.com/free-vector/mobile-login-concept-illustration_114360-135.jpg?t=st=1710651496~exp=1710655096~hmac=b4833f80018d561d11b256ad0b07a6bee9a847d942ee181b45054e285be80880&w=740')),
                SizedBox(height: 10,),

                Container(
                  height: 55,

                  margin: EdgeInsets.only(left: 30,right: 30,bottom: 20),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.black),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)),

                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Center(
                      child: TextField(
                        onChanged: (value){
                          userName = value;
                        },
                        style: TextStyle(fontSize: 18,color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'UserName',
                          hintStyle: TextStyle(color: Colors.black54),
                          prefixIcon: Icon(Icons.verified_user,color: Colors.black54,),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 55,

                  margin: EdgeInsets.only(left: 30,right: 30),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.black),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)),

                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Center(
                      child: TextField(
                        onChanged: (value){
                          email = value;
                        },
                        style: TextStyle(fontSize: 18,color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.black54),

                          prefixIcon: Icon(Icons.mail_outline,color: Colors.black54,),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 55,

                  margin: EdgeInsets.only(left: 30,right: 30,top: 20),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.black),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)),

                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Center(
                      child: TextField(
                        onChanged: (value){
                          password = value;
                        },
                        style: TextStyle(fontSize: 18,color: Colors.black),
                        decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.black54),
                            prefixIcon: Icon(Icons.password_sharp,color: Colors.black54,),
                            border: InputBorder.none,
                            filled: false
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 55,

                  margin: EdgeInsets.only(left: 30,right: 30,top: 20),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.black),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)),

                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Center(
                      child: TextField(
                        onChanged: (value) {
                          CPassword = value;
                        },
                        style: TextStyle(fontSize: 18,color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(color: Colors.black54),
                          prefixIcon: Icon(Icons.password_sharp,color: Colors.black54,),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 55,
                  margin: EdgeInsets.only(left: 30,right: 30,top: 0),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.black),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)),

                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Center(
                      child:  DropdownButton(
                        value: profession,

                        icon: const Icon(Icons.keyboard_arrow_down),

                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            profession = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 55,

                  margin: EdgeInsets.only(left: 30,right: 30,bottom: 20),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.black),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)),

                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Center(
                      child: TextField(
                        onChanged: (value){
                          qualification = value;
                        },
                        style: TextStyle(fontSize: 18,color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Qualification',
                          hintStyle: TextStyle(color: Colors.black54),
                          prefixIcon: Icon(Icons.verified_user,color: Colors.black54,),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 55,

                  margin: EdgeInsets.only(left: 30,right: 30,bottom: 20),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.black),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)),

                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Center(
                      child: TextField(
                        onChanged: (value){
                          about = value;
                        },
                        style: TextStyle(fontSize: 18,color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'About',
                          hintStyle: TextStyle(color: Colors.black54),
                          prefixIcon: Icon(Icons.verified_user,color: Colors.black54,),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 55,

                  margin: EdgeInsets.only(left: 30,right: 30,bottom: 20),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.black),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)),

                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Center(
                      child: TextField(
                        onChanged: (value){
                          chargesph = value;
                        },
                        style: TextStyle(fontSize: 18,color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Charges per Session Rs.379/-',
                          hintStyle: TextStyle(color: Colors.black54),
                          prefixIcon: Icon(Icons.verified_user,color: Colors.black54,),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),





                InkWell(
                  onTap: () async{
                    if(userName.isEmpty || email.isEmpty || password.isEmpty || CPassword.isEmpty || qualification.isEmpty || about.isEmpty || chargesph.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Required Field')
                            ,backgroundColor: Colors.green.shade900,));
                    }else if(password != CPassword){
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Enter valid password')
                            ,backgroundColor: Colors.green.shade900,));
                    }
                    else {

                      String prof = profession.replaceAll(RegExp(r'\s+'), '');
                      final url = 'https://hackhive-justcoders.onrender.com/api/mentor/register';
                      final uri = Uri.parse(url);
                      final body = {
                        'username' : userName,
                        'email':email,
                        'password':password,
                        'profession':prof,
                        'qualification':qualification,
                        'about':about,
                        'chargesph':456,
                        'disorders':[
                          {"disorder_name": "disorder-1"},
                          {"disorder_name": "disorder-2"},
                          {"disorder_name": "disorder-3"}
                        ],

                      };
                      final header = {
                        'content-type' : 'application/json'
                      };
                      final response = await http.post(uri,body: jsonEncode(body),headers:  header);

                      if(response.statusCode ==200){

                        final result = json.decode(response.body);
                        final fResult = result['rest'];

                        print(result);
                        print(fResult['_id']);
                        print(fResult['token']);
                        print(fResult['email']);
                        final otp = fResult['token'];
                        final email = fResult['email'];
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MentorVerify(otp: otp, email: email),));


                      }else{
                        print(response.statusCode);
                        print(response.body);
                      }

                    }
                  },
                  child: Container(
                      height: 45,
                      width: 200,
                      margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1,color: Colors.white),
                          color: Colors.blue.shade500,
                          borderRadius: BorderRadius.circular(40)),

                      child:  Center(child: Text('Continue',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),))
                  ),

                ),
                Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
                    child:  Text(
                      'OR',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),

                    )
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child: Row(

                    children: [
                      Expanded(
                        child: Container(
                          child: Center(
                            child: Text(
                              'Already have an account ?',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MentorLogin(),));
                  },
                  child: Container(
                      height: 45,
                      width: 200,
                      margin: EdgeInsets.only(left: 20,right: 20 ,bottom: 100),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1,color: Colors.black),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(40)),

                      child:  Center(child: Text('Login',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),))
                  ),
                ),
              ],
            ),
          ),
        ),
      ),




    );
  }
}

