import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/screens/localNotes.dart';
import 'package:notes/screens/notes.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:notes/screens/profile.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  var _activePage = 0;
  final _pageViewController = PageController();

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
        title: Text(
          _getAppbarTitle(),
          style: GoogleFonts.inter(
            fontSize: 28,
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
        child: PageView(
          controller: _pageViewController,
          children: const [
            LocalNotesCard(),
            NotesCard(),
            Profile(),
          ],
          onPageChanged: (value) {
            setState(() {
              _activePage = value;
            });
          },
        ),
      ),

      // FLOATING ACTION BUTTON TO ADD NOTES
      // Don't show FAB on settings page
      floatingActionButton: _activePage == 2
          ? null
          : FloatingActionButton(
              onPressed: () {
                if (_activePage == 0) {
                  Navigator.pushNamed(context, "/addLocal");
                } else {
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
              padding: const EdgeInsets.all(8),
              selectedIndex: _activePage,
              onTabChange: (index) {
                _pageViewController.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.bounceIn);
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

  String _getAppbarTitle() {
    if (_activePage == 0) {
      return "Local Notes";
    } else if (_activePage == 1) {
      return "Share with Others";
    }
    return "Settings";
  }
}

// Widget screenTypes(var screen) {
//   if (screen == 0) {
//     return const LocalNotesCard();
//   } else if (screen == 1) {
//     return const NotesCard();
//   }
//   return const Profile();
// }
