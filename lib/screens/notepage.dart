import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/widgets/body.dart';
import 'package:notes/widgets/syncNotesBody.dart';

import '../model/colour.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
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
            color: appBarTextColor,
          ),
        ),
      ),
      body: SyncNotesBody(
        "Share your view with others about \n\n- daily goals\n\n- ideas in mind\n\n- articles\n\n- save text and links\n\n- Reminders",
      ),
    );
    // ignore: dead_code
  }
}
