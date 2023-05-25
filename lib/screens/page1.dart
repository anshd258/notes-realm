import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/screens/localNotes.dart';
import 'package:notes/screens/notes.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:notes/screens/profile.dart';

import '../model/colour.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  var screen = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: ScreenTypes(screen),
        // child: screen==0 ? const LocalNotesCard(): const NotesCard() ,
      ),

      // FLOATING ACTION BUTTON TO ADD NOTES
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(screen == 0){
            Navigator.pushNamed(context, "/addLocal");
          }else{
            Navigator.pushNamed(context, "/notespage");
          }
        },
        tooltip: 'Increment',
        backgroundColor: const Color.fromARGB(255, 255, 246, 169),
        child: const Icon(
          Icons.add,
          color: Colors.black87,
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GNav(
            gap: 6,
              backgroundColor: Colors.black,
              color: Colors.white70,
              activeColor: Colors.white70,
              tabBackgroundColor: Colors.grey.shade500,
              padding: EdgeInsets.all(8),
              onTabChange: (index){
                setState(() {
                  screen = index;
                });
                print(index);
              },
              tabs: const [
                GButton(
                    icon: Icons.visibility_off,
                    text: "Local Notes",
                ),
                GButton(
                    icon: Icons.visibility,
                    text: "Share with Others",
                ),
                GButton(
                  icon: Icons.account_circle,
                  text: "Profile",
                )
              ]),
        ),
      ),
    );
  }

  // ScreenTypes() {
  //   print(screen);
  //   if(screen == 0){
  //     print("geiiiiiiiiiiiiii");
  //
  //   }else if(screen == 1){
  //     NotesCard();
  //   }else if(screen == 2){
  //     Profile();
  //   }
  // }

}

ScreenTypes(var screen) {
  print(screen);
    if(screen == 0){
      return LocalNotesCard();
    }else if(screen == 1){
      return NotesCard();
    }else if(screen == 2){
      return Profile();
    }
}
