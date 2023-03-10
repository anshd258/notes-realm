import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/screens/notes.dart';

import '../model/colour.dart';



class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Background,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
        title: Text(
          'NOTES',
          style: GoogleFonts.arya(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      body: NotesCard(),

      // FLOATING ACTION BUTTON TO ADD NOTES
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/notespage");
        },
        tooltip: 'Increment',
        backgroundColor: const Color.fromARGB(255, 255, 246, 169),
        child: const Icon(Icons.add,color: Colors.black87,),
      ),
    );
  }
}