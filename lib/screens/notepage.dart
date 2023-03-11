import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:uuid/uuid.dart';
import '../model/colour.dart';
import '../provider/notes_provider.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final TextEditingController _controller = TextEditingController();
  final date = DateTime.now();
  var uuid = const Uuid();

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    return Scaffold(
      backgroundColor: Background,
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('ADD YOUR NOTE'),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        backgroundColor: addappbar,
      ),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 85.w,
            padding: EdgeInsets.symmetric(vertical: 2.h),
            height: 60.h,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
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
                    decoration: InputDecoration(
                      hintText:
                          "Write about your\n\n- daily goals\n\n- ideas in mind\n\n- articles\n\n- save text and links\n\n- Reminders",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        borderSide: BorderSide(
                            width: 0.5, color: Colors.greenAccent.shade400),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        borderSide: BorderSide(
                            width: 0.5, color: Colors.greenAccent.shade400),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        borderSide: BorderSide(
                            width: 0.5, color: Colors.greenAccent.shade400),
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
                    context
                        .read<NotesProvider>()
                        .create(_controller.text, uuid.v4());
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  child: const Padding(
                    padding: EdgeInsets.all(11.0),
                    child: Text("ADD"),
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
    // ignore: dead_code
    //   @override
    // void dispose() {
    //   _controller.dispose();
    //   super.dispose();
    // }
  }
}
