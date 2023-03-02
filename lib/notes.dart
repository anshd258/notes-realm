import 'package:flutter/material.dart';
import 'package:notes/model/colour.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import './provider/notesprovider.dart';

class NotesCard extends StatefulWidget {
  const NotesCard({super.key});

  @override
  State<NotesCard> createState() => _NotesCardState();
}

class _NotesCardState extends State<NotesCard> {
  // LIST OF THE NOTES
  TextEditingController ctr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final notes = context.watch<NotesProvider>().notes;
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(20),
          child: Column(
            // MAAPING THE ITEMS OF THE LIST IN CARDS
            children: notes.map((e) {
              final date = DateTime.parse(e.date!);
              return Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      // WHITE CARD CONTAINING NOTES
                      Positioned(
                        child: Container(
                          height: 15.h,
                          width: 75.w,
                          margin: const EdgeInsets.only(top: 30),
                          decoration: BoxDecoration(
                            color: noteandmodelcard,
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
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(
                                      180, 10, 10, 10),
                                  child: Wrap(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          showModalBottomSheet(
                                              backgroundColor:
                                                  noteandmodelcard,
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
                                                        TextField(
                                                          controller: ctr,
                                                          style: GoogleFonts
                                                              .ubuntu(
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 50,
                                                        ),
                                                        OutlinedButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                            context
                                                                .read<
                                                                    NotesProvider>()
                                                                .updatenote(
                                                                    ctr.text,
                                                                    e.uuid!);
                                                          },
                                                          child: Text(
                                                            'UPDATE',
                                                            style: GoogleFonts
                                                                .ubuntu(
                                                              fontSize: 20,
                                                              color:
                                                                  textcolour,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              });
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                          size: 20,
                                          color: updateicon,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          
                                       context .read<NotesProvider>().deletenode(e);},
                                        icon: const Icon(
                                          Icons.delete,
                                          size: 20,
                                          color: deleteicon,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 1, 10, 10),
                                  child: Text(
                                    e.note!,
                                    style: GoogleFonts.ubuntu(fontSize: 1.5.h),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // YELLOW CARD WITH DATE
                      Positioned(
                        left: 3.h,
                        child: Container(
                          alignment: Alignment.center,
                          height: 7.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                            color: dateandadd,
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
                            style: GoogleFonts.ubuntu(fontSize: 1.5.h),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
