// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:uuid/uuid.dart';
import '../model/colour.dart';
import '../provider/notesprovider.dart';
import 'package:toast/toast.dart';
import 'package:motion_toast/motion_toast.dart';

class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  final TextEditingController _controller = TextEditingController();
  final date = DateTime.now();
  var uuid = const Uuid();

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    return Scaffold(
      backgroundColor:Background,
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
        child: SingleChildScrollView(
          child: Container(
            width: 85.w,
            padding: EdgeInsets.symmetric(vertical: 2.h),
            height: 60.h,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text("${date.day} - ${date.month} - ${date.year}",style: TextStyle(fontSize:15,fontWeight: FontWeight.w500),),
                ),
                SizedBox(
                  width: 70.w,
                  child: TextField(
                    maxLines: 12,
                    textAlign: TextAlign.center,
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Write about your\n\n- daily goals\n\n- ideas in mind\n\n- articles\n\n- save text and links\n\n- Reminders",
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
                ElevatedButton(onPressed: (){
                  if(_controller.text.isEmpty){
                    MotionToast.error(description: Text("Enter some text"),title: Text("Can't be added"),position: MotionToastPosition.top,animationType: AnimationType.fromTop,height: 50,width: double.infinity,padding: EdgeInsets.fromLTRB(10, 55, 10,0),).show(context);
                    // const snackbar = SnackBar(content: Text("Enter some text",style: TextStyle(fontWeight:FontWeight.bold),),backgroundColor: Colors.red,elevation: 10,behavior: SnackBarBehavior.floating,margin: EdgeInsets.fromLTRB(5,0,5,20),);
                    // ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    
                  }else{
                    print(_controller.text);
                    context.read<NotesProvider>().Create(_controller.text,uuid.v4());
                    Navigator.pop(context);
                  }
                    

                },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(11.0),
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
    @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }
  }
}
