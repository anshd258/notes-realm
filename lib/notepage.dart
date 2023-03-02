import 'package:flutter/material.dart';
import 'package:notes/model/colour.dart';
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
      backgroundColor: Background,
      appBar: AppBar(
        leading: BackButton(),
        title: Text('ADD YOUR NOTE'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        backgroundColor: addappbar,
      ),
      body: SafeArea(
          child: Center(
        child: Container(
          width: 70.w,
          padding: EdgeInsets.symmetric(vertical: 2.h),
          height: 40.h,
          decoration: const BoxDecoration(
            color: noteandmodelcard,
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
                  decoration:const  InputDecoration(
                    focusedBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      borderSide: BorderSide(
                          width: 0.5, color: Borderside),
                    ),
                    enabledBorder:  OutlineInputBorder(
                      borderRadius:  BorderRadius.all(
                        Radius.circular(20),
                      ),
                      borderSide: BorderSide(
                          width: 0.5, color: Borderside),
                    ),
                    border:  OutlineInputBorder(
                      borderRadius:  BorderRadius.all(
                        Radius.circular(20),
                      ),
                      borderSide: BorderSide(
                          width: 0.5, color: Borderside),
                    ),
                    icon:  Icon(
                      Icons.text_fields_rounded,
                      color: fieldcolor,
                    ),
                  ),
                ),
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  Navigator.pop(context);
                  context.read<NotesProvider>().addnote(_controller.text);
                },
                label: const Text("ADD"),
                backgroundColor: Background,
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
