import 'package:flutter/material.dart';
import 'package:notes/model/notesmodel.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import './provider/notesprovider.dart';

class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 77, 168, 20),
      appBar: AppBar(
        leading: BackButton(),
        title: Text('ADD YOUR NOTE'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Center(
        child: Container(
          width: 70.w,
          padding: EdgeInsets.symmetric(vertical: 2.h),
          height: 40.h,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("${date.day} - ${date.month} - ${date.year}"),
              SizedBox(
                width: 60.w,
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: _controller,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      borderSide: BorderSide(
                          width: 0.5, color: Colors.greenAccent.shade400),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      borderSide: BorderSide(
                          width: 0.5, color: Colors.greenAccent.shade400),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      borderSide: BorderSide(
                          width: 0.5, color: Colors.greenAccent.shade400),
                    ),
                    icon: Icon(
                      Icons.text_fields_rounded,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  Navigator.pop(context);
                  context.read<NotesProvider>().addnote(_controller.text);
                },
                label: Text("ADD"),
                backgroundColor: Colors.green,
              )
            ],
          ),
        ),
      )),
    );
    // ignore: dead_code
    @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }
  }
}
