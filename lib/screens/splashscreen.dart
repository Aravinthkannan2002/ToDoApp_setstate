import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app_setstate/screens/home_screen.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final mediaHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              'assets/animations/splash.json',
              width: mediaWidth * 0.5, // 50% of screen width
            ),
            SizedBox(height: mediaHeight * 0.05), // 5% of screen height
            SizedBox(
              width: mediaWidth * 0.1, // 10% of screen width
              height: mediaWidth * 0.1,
              child: const CircularProgressIndicator(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
