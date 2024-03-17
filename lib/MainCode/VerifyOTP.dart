import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackhive/MainCode/Login.dart';
import 'package:hackhive/MainCode/Signup.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Verify extends StatefulWidget {
  String otp,email;
  Verify({super.key,required this.otp,required this.email});

  @override
  State<StatefulWidget> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {

  String OTP ='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.email);
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text(" ", style: TextStyle(color: Colors.black),),
        backgroundColor:     Colors.white,
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
                    Colors.blue.shade50,
                    Colors.blue.shade100,
                    Colors.blue.shade200,
                  ]
              )
          ),

          child: SingleChildScrollView(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 150,
                    child: Image.asset('assets/images/forgot.png')),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Container(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 40,
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
                          OTP = value;
                        },
                        style: TextStyle(fontSize: 18,color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'OTP',
                          hintStyle: TextStyle(color: Colors.black54),
                          prefixIcon: Icon(Icons.password,color: Colors.black54,),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),


                InkWell(
                  onTap: () async{
                    print(widget.email);

                    final url = 'https://hackhive-justcoders.onrender.com/api/user/verify';
                    final uri = Uri.parse(url);
                    final body = {
                      'token' : OTP,
                      'email':widget.email,

                    };
                    final header = {
                      'content-type' : 'application/json'
                    };
                    final response = await http.post(uri,body: jsonEncode(body),headers:  header);

                    if(response.statusCode ==200){

                      final result = json.decode(response.body);

                      print(response.statusCode);
                      print(response.body);

                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                            (route) => false, // Removes all routes from the stack
                      );


                    }else{
                      print(response.statusCode);
                      print(response.body);
                    }

                  },
                  child: Container(
                      height: 45,
                      width: 200,
                      margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1,color: Colors.white),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(40)),

                      child:  Center(child: Text('Verify',style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: 'poppins'),))
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



