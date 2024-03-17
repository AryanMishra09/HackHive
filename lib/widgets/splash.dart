import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    // Check if there's any stored authentication token or session data
    final token = await storage.read(key: 'token');

    // Delay for a short duration to show the splash screen
    await Future.delayed(Duration(seconds: 2));

    // Navigate to the appropriate screen based on the authentication status
    if (token != null && token.isNotEmpty) {
      // User is logged in, navigate to the home screen
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // User is not logged in, navigate to the login screen
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
