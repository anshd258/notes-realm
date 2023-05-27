import 'package:flutter/material.dart';
import 'package:notes/model/colour.dart';
import 'package:notes/screens/page1.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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

  Future<void> _navigatetohome() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Page1(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: backgroundGradient,
          ),
        ),
        child: Center(
          child: Container(
            width: 40.h,
            height: 40.h,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
              borderRadius: const BorderRadius.all(
                Radius.circular(40),
              ),
              color: const Color.fromARGB(255, 179, 229, 190),
              image: const DecorationImage(
                image: AssetImage('assets/notes.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
