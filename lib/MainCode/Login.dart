import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hackhive/MainCode/LandingOption.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'HomeOption.dart';
import 'Signup.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final storage = FlutterSecureStorage();
  String email = '';
  String password = '';
  bool isLoading = false; // Add loading state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          " ",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor:    Colors.white,
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
                Colors.grey.shade50,
                Colors.blue.shade100,
                Colors.blue.shade200,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                  height: 190,

                  child: Image.network('https://img.freepik.com/free-vector/mobile-login-concept-illustration_114360-232.jpg?t=st=1710650544~exp=1710654144~hmac=b5bcf200925da88006ff01abb079fcb226c6cbdc469b03d87e587b133b674d04&w=740'),
                ),
                SizedBox(height: 10),

                Container(
                  height: 55,
                  margin: EdgeInsets.only(left: 30, right: 30),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Center(
                      child: TextField(
                        onChanged: (value) {
                          email = value;
                        },
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.black54),
                          prefixIcon: Icon(Icons.mail_outline, color: Colors.black54),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 55,
                  margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Center(
                      child: TextField(
                        onChanged: (value) {
                          password = value;
                        },
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'password',
                          hintStyle: TextStyle(color: Colors.black54),
                          prefixIcon: Icon(Icons.password_sharp, color: Colors.black54),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () async {
                    setState(() {
                      isLoading = true; // Show progress indicator
                    });

                    final url = 'https://hackhive-justcoders.onrender.com/api/user/login';
                    final uri = Uri.parse(url);
                    final body = {'email': email, 'password': password};
                    final header = {'content-type': 'application/json'};
                    final response = await http.post(
                      uri,
                      body: jsonEncode(body),
                      headers: header,
                    );

                    setState(() {
                      isLoading = false; // Hide progress indicator
                    });

                    if (response.statusCode == 200) {
                      final result = json.decode(response.body);
                      final fResult = result['user'];

                      await storage.write(key: 'Id', value: fResult['_id']);
                      await storage.write(key: 'userType', value: 'user');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Login Successfully'),
                          backgroundColor: Colors.green.shade900,
                        ),
                      );
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LandingOption()),
                            (route) => false, // Removes all routes from the stack
                      );
                    } else {
                      final result = json.decode(response.body);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(result['message']),
                          backgroundColor: Colors.green.shade900,
                        ),
                      );
                      print(response.statusCode);
                    }
                  },
                  child: Container(
                    height: 45,
                    width: 200,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 5),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white),
                      color: Colors.blue.shade500,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: isLoading // Show progress indicator if loading
                        ? Center(child: CircularProgressIndicator())
                        : Center(child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'poppins', ))),
                  ),
                ),
                Icon(Icons.offline_bolt_outlined, size: 30),
                InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Create your  account'),
                        backgroundColor: Colors.green.shade900,
                      ),
                    );
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen(),));
                  },
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen(),));
                    },
                    child: Container(
                      height: 45,
                      width: 200,
                      margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(child: Text('Signup', style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'poppins',fontWeight: FontWeight.bold))),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.verified_user),
                      Text(
                        'Secure Login',
                        style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'Poppins'),
                      ),
                    ],
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
