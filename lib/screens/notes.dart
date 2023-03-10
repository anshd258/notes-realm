import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:notes/model/colour.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/notesprovider.dart';

class NotesCard extends StatefulWidget {
  const NotesCard({super.key});

  @override
  State<NotesCard> createState() => _NotesCardState();
}

class _NotesCardState extends State<NotesCard> {
  // LIST OF THE NOTES
  TextEditingController ctr = TextEditingController();
  @override

  @override
  Widget build(BuildContext context){
    final notes = context.watch<NotesProvider>().notes;

    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Column(
              // MAAPING THE ITEMS OF THE LIST IN CARDS
              children: notes.map<Widget>((e) {
                final date = e.date;
                return Column(
                  children: [
                    const SizedBox(
                      height: 19,
                    ),
                    Stack(
                      children: [
                        // WHITE CARD CONTAINING NOTES
                        Positioned(
                          child: Container(
                            height: 18.h,
                            width: 77.w,
                            margin: const EdgeInsets.only(top: 30),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              border: Border.all(
                                color: Colors.transparent,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(25),
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(143, 0, 0, 0),
                                  offset: Offset(0, 4),
                                  blurRadius: 4,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(21, 20, 6, 10),
                                      child: Text(
                                        e.content!,
                                        style: TextStyle(fontSize: 15.sp,fontStyle: FontStyle.normal,height: 0.16.h),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0,15,1,8),
                                  child: VerticalDivider(width: 8,thickness: 1,color: Colors.grey,),
                                ),
                                Column(
                                  children: [
                                    SizedBox(height: 1.h,),
                                    Expanded(
                                      child: IconButton(
                                        onPressed: () {
                                          String value = e.content!;
                                          print(value);
                                          showModalBottomSheet(
                                              backgroundColor: noteandmodelcard,
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Container(
                                                  margin:
                                                  const EdgeInsets.all(40),
                                                  child: Center(
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 30,
                                                        ),
                                                        TextFormField(
                                                          initialValue: value,
                                                          onChanged: (text){
                                                            value=text;

                                                          },
                                                          style: GoogleFonts
                                                              .ubuntu(
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 100,
                                                        ),
                                                        OutlinedButton(
                                                          onPressed: () {
                                                            context.read<NotesProvider>().update(value,e.id);
                                                            Navigator.pop(
                                                                context);

                                                          },
                                                          child: Text(
                                                            'UPDATE',
                                                            style: GoogleFonts
                                                                .ubuntu(
                                                              fontSize: 20,
                                                              color:
                                                              Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              });
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          size: 24,
                                          color: Colors.blue[900],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: IconButton(
                                        onPressed: () {
                                          context.read<NotesProvider>().delete(e);

                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          size: 24,
                                          color: Colors.red[900],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 1.h,),

                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        Positioned(
                          left: 2.h,
                          child: Container(
                            alignment: Alignment.center,
                            height: 4.8.h,
                            width: 21.w,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 246, 189),
                              border: Border.all(
                                color: Colors.transparent,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(113, 0, 0, 0),
                                  offset: Offset(0, 4),
                                  blurRadius: 2,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Text(
                              "${date.day} - ${date.month} - ${date.year}",
                              style: GoogleFonts.ubuntu(fontSize: 1.6.h),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              }).toList(),
            ),
            SizedBox(height: 40)
          ],
        ),
      ),
    );
  }


}


