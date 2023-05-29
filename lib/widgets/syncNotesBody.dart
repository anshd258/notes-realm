import 'package:flutter/material.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:notes/model/colour.dart';
import 'package:notes/provider/local_notes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:uuid/uuid.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:provider/provider.dart';

import '../provider/notes_provider.dart';

class SyncNotesBody extends StatefulWidget {
  final String hintText;
  // make it named if more parameters are required
  const SyncNotesBody(this.hintText);

  @override
  State<SyncNotesBody> createState() => _SyncNotesBodyState();
}

class _SyncNotesBodyState extends State<SyncNotesBody> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _showToast() {
    MotionToast.error(
      description: const Text("Enter some text"),
      title: const Text("Can't be added!"),
      position: MotionToastPosition.top,
      animationType: AnimationType.fromTop,
      height: 50,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(10, 55, 10, 0),
    ).show(context);
  }

  void _addNewNote() {
    final notesProvider = Provider.of<NotesProvider>(context, listen: false);
    var uuid = const Uuid();
    notesProvider.create(
      _controller.text,
      uuid.v4(),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: backgroundGradient,
        ),
      ),
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
                    "${DateTime.now().day} - ${DateTime.now().month} - ${DateTime.now().year}",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  width: 70.w,
                  child: TextField(
                    maxLines: 12,
                    textAlign: TextAlign.center,
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        borderSide: BorderSide(
                          width: 0.5,
                          color: Color.fromARGB(255, 4, 101, 130),
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        borderSide: BorderSide(
                          width: 0.5,
                          color: Color.fromARGB(255, 4, 101, 130),
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        borderSide: BorderSide(
                          width: 0.5,
                          color: Color.fromARGB(255, 4, 101, 130),
                        ),
                      ),
                      icon: const Icon(
                        Icons.text_fields_rounded,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_controller.text.isEmpty) {
                      _showToast();
                    } else {
                      _addNewNote();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 4, 101, 130),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(11.0),
                    child: Text("Add"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
