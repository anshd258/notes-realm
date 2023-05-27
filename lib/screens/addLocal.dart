// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/widgets/body.dart';

class LocalNotes extends StatefulWidget {
  const LocalNotes({super.key});

  @override
  State<LocalNotes> createState() => _LocalNotesState();
}

class _LocalNotesState extends State<LocalNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Your Note',
          style: GoogleFonts.arya(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: PageBody(
          "Write about your\n\n- daily goals\n\n- ideas in mind\n\n- articles\n\n- save text and links\n\n- Reminders"),
    );
  }
}
