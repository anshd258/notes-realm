import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:uuid/uuid.dart';
import '../model/colour.dart';
import 'package:motion_toast/motion_toast.dart';
import '../provider/local_notes.dart';
import '../provider/notes_provider.dart';

class LocalNotes extends StatefulWidget {
  const LocalNotes({super.key});

  @override
  State<LocalNotes> createState() => _LocalNotesState();
}

class _LocalNotesState extends State<LocalNotes> {
  final TextEditingController _controller = TextEditingController();
  final date = DateTime.now();
  var uuid = const Uuid();

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
        title: Text(
          'Add Your Note',
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
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 85.w,
              padding: EdgeInsets.symmetric(vertical: 2.h),
              height: 55.h,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                // color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "${date.day} - ${date.month} - ${date.year}",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    width: 70.w,
                    child: TextField(
                      maxLines: 12,
                      textAlign: TextAlign.center,
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText:
                        "Write about your\n\n- daily goals\n\n- ideas in mind\n\n- articles\n\n- save text and links\n\n- Reminders",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(
                            width: 0.5,
                            color: Color.fromARGB(255, 4, 101, 130),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(
                            width: 0.5,
                            color: Color.fromARGB(255, 4, 101, 130),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(
                            width: 0.5,
                            color: Color.fromARGB(255, 4, 101, 130),
                          ),
                        ),
                        icon: Icon(
                          Icons.text_fields_rounded,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_controller.text.isEmpty) {
                        MotionToast.error(
                          description: const Text("Enter some text"),
                          title: const Text("Can't be added!!!!"),
                          position: MotionToastPosition.top,
                          animationType: AnimationType.fromTop,
                          height: 50,
                          width: double.infinity,
                          padding: const EdgeInsets.fromLTRB(10, 55, 10, 0),
                        ).show(context);
                        // const snackbar = SnackBar(content: Text("Enter some text",style: TextStyle(fontWeight:FontWeight.bold),),backgroundColor: Colors.red,elevation: 10,behavior: SnackBarBehavior.floating,margin: EdgeInsets.fromLTRB(5,0,5,20),);
                        // ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      } else {
                        print("hiii");
                        context
                            .read<LocalNotesProvider>()
                            .create(_controller.text, uuid.v4());
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 4, 101, 130),
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)))),
                    child: const Padding(
                      padding: EdgeInsets.all(11.0),
                      child: Text("ADD"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
    // ignore: dead_code
    //   @override
    // void dispose() {
    //   _controller.dispose();
    //   super.dispose();
    // }
  }
}
