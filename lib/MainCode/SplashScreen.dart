import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hackhive/MainCode/HomeOption.dart';
import 'package:hackhive/MainCode/LandingOption.dart';
import 'package:hackhive/MainCode/MentorHome.dart';
import 'package:hackhive/MainCode/MentorHomeOption.dart';
import 'package:hackhive/MainCode/getStarted.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  final storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();

    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {

    final id = await storage.read(key: 'Id');

    // Delay for a short duration to show the splash screen
    await Future.delayed(Duration(seconds: 2));

    // Navigate to the appropriate screen based on the authentication status
    if (id != null && id.isNotEmpty) {
      final userType = await storage.read(key: 'userType');
      if(userType == 'user'){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LandingOption(),));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MentorHomeOption(),));
      }

      // User is logged in, navigate to the home screen

    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GetStarted(),));
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 150,
          child: Image.asset('assets/images/forgot.png'),
        ),
      ),
    );
  }
}
