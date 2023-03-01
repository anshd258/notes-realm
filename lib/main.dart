import 'package:flutter/material.dart';
import 'package:notes/notepage.dart';
import 'package:notes/page1.dart';
import 'package:sizer/sizer.dart';
import './provider/notesprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NotesProvider>(
      create: (context) => NotesProvider(),
      child: Sizer(
        builder: ((context, orientation, deviceType) {
          return MaterialApp(
            initialRoute: "/",
            routes: {
              '/': (context) => const page1(),
              '/notespage': (context) => const page2()
            },
            debugShowCheckedModeBanner: false,
          );
        }),
      ),
    );
  }
}
