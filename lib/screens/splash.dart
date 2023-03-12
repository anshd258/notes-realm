import 'package:flutter/material.dart';
import 'package:notes/screens/page1.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() {
    Future.delayed(const Duration(seconds: 5), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Page1()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Container(
          width: 250,
          height: 250,
          decoration: const BoxDecoration(
            color: Colors.greenAccent,
            image: DecorationImage(
              image: AssetImage('assets/notes.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
