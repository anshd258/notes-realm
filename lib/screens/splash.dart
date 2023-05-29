import 'package:flutter/material.dart';
import 'package:notes/model/colour.dart';
import 'package:notes/provider/local_notes.dart';
import 'package:notes/provider/loginRealm.dart';
import 'package:notes/provider/notes_provider.dart';
import 'package:notes/screens/login.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:permission_handler/permission_handler.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    getPermission();
    _navigatetohome();
  }

  Future<void> getPermission() async {}

  Future<void> _navigatetohome() async {
   
    await Future.delayed(const Duration(seconds: 3), () {});
    Navigator.pushNamedAndRemoveUntil(
      context,
      "/page1",
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    context.read<LoginRealm>().login().then((value) {
      context.read<NotesProvider>().intialize(value);
      context.read<LocalNotesProvider>().intialize( value);
    });
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
