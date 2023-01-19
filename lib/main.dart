import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/notes.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: ((context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: const Color.fromARGB(255, 84, 161, 76),
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              title: Text(
                'NOTES',
                style: GoogleFonts.rubik(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            body: const NotesCard(),

            // FLOATING ACTION BUTTON TO ADD NOTES
            floatingActionButton: FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              backgroundColor: const Color.fromARGB(255, 255, 246, 169),
              child: const Icon(Icons.add),
            ),
          ),
        );
      }),
    );
  }
}
