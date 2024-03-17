import 'dart:ui';
import 'package:flutter/material.dart';

class color{

// AppBar Color
 Color appBarColor = Colors.deepPurple.shade50;

// App theme Color
 Color buttonColor = Colors.deepPurple.shade300;

// Common Color
 Color purple = Colors.deepPurple.shade50;
 Color black = Colors.black;
 Color white = Colors.white;

}

class style{

TextStyle mini = TextStyle(fontSize: 15,color: Colors.black,fontFamily: 'Poppins');
TextStyle small = TextStyle(fontSize: 18,color: Colors.black,fontFamily: 'Poppins');
TextStyle medium = TextStyle(fontSize: 22,color: Colors.black,fontFamily: 'Poppins');
TextStyle large = TextStyle(fontSize: 30,color: Colors.black,fontFamily: 'Poppins');
TextStyle vlarge = TextStyle(fontSize: 40,color: Colors.black,fontFamily: 'Poppins');

}

class wight{

 TextStyle mini = TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold);
 TextStyle small = TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold);
 TextStyle medium = TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold);
 TextStyle large = TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold);
 TextStyle vlarge = TextStyle(fontSize: 40,color: Colors.black,fontWeight: FontWeight.bold);

}

class button{

 OutlinedButton oButton = OutlinedButton(onPressed: (){}, child: Text('Submit',style: style().small,));

}


