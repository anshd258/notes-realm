import 'package:flutter/material.dart';
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

  _navigatetohome() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Page1()));
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
          colors: [
            Colors.black,
            Color.fromARGB(255, 2, 41, 52),
            Color.fromARGB(255, 3, 78, 101),
            Color.fromARGB(255, 4, 88, 113),
            Color.fromARGB(255, 4, 101, 130),
          ],
        )),
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
