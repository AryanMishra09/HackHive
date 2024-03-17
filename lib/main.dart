import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackhive/MainCode/AllMentors.dart';
import 'package:hackhive/MainCode/CategoryMentors.dart';
import 'package:hackhive/MainCode/Home.dart';
import 'package:hackhive/MainCode/HomeOption.dart';
import 'package:hackhive/MainCode/LandingOption.dart';
import 'package:hackhive/MainCode/Login.dart';
import 'package:hackhive/MainCode/MentorSignup.dart';
import 'package:hackhive/MainCode/MentorUpdate/UpdateScedule.dart';
import 'package:hackhive/MainCode/Signup.dart';
import 'package:hackhive/MainCode/SplashScreen.dart';
import 'package:hackhive/MainCode/getStarted.dart';
import 'package:hackhive/MainCode/mentorLogin.dart';
import 'package:hackhive/style/theme.dart';
import 'package:hackhive/widgets/listViewBuilder.dart';
import 'package:hackhive/widgets/CURD.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JustCCoders',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: color().appBarColor),
        useMaterial3: true,
      ),
      home: Splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: style().small,
            ),
            Text(
              '$_counter',
              style: style().medium,
            ),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/images/sak.png'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        backgroundColor: color().buttonColor,
        tooltip: 'Increment',
        child: const Icon(Icons.add,),
      ),
    );
  }
}
