import 'package:flutter/material.dart';
import 'package:notes/model/colour.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../provider/local_notes.dart';
import '../provider/notes_provider.dart';

class LocalNotesCard extends StatefulWidget {
  const LocalNotesCard({super.key});

  @override
  State<LocalNotesCard> createState() => _LocalNotesCardState();
}

class _LocalNotesCardState extends State<LocalNotesCard> {
  // LIST OF THE NOTES
  TextEditingController ctr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final notes = context.watch<NotesProvider>().notes;
    final notes = context.watch<LocalNotesProvider>().notes;

    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 110,
            ),
            Column(
              // MAAPING THE ITEMS OF THE LIST IN CARDS
              children: notes!.isEmpty
                  ? const [
                      Text(
                        'No notes are there currently',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Tap on '+' to add notes",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ]
                  : notes.map<Widget>((e) {
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
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: SingleChildScrollView(
                                          child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                21, 20, 6, 10),
                                            child: Text(
                                              e.content!,
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontStyle: FontStyle.normal,
                                                  height: 0.16.h),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 15, 1, 8),
                                        child: VerticalDivider(
                                          width: 8,
                                          thickness: 1,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Expanded(
                                            child: IconButton(
                                              onPressed: () {
                                                String value = e.content!;
                                                showModalBottomSheet(
                                                    backgroundColor:
                                                        noteandmodelcard,
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return Container(
                                                        margin: const EdgeInsets
                                                            .all(40),
                                                        child: Center(
                                                          child: Column(
                                                            children: [
                                                              const SizedBox(
                                                                height: 30,
                                                              ),
                                                              TextFormField(
                                                                initialValue:
                                                                    value,
                                                                onChanged:
                                                                    (text) {
                                                                  value = text;
                                                                },
                                                                style:
                                                                    GoogleFonts
                                                                        .ubuntu(
                                                                  fontSize: 20,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 100,
                                                              ),
                                                              OutlinedButton(
                                                                onPressed: () {
                                                                  context
                                                                      .read<
                                                                          LocalNotesProvider>()
                                                                      .update(
                                                                          value,
                                                                          e.uuid);
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Text(
                                                                  'UPDATE',
                                                                  style:
                                                                      GoogleFonts
                                                                          .ubuntu(
                                                                    fontSize:
                                                                        20,
                                                                    color: Colors
                                                                        .black,
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
                                                context
                                                    .read<LocalNotesProvider>()
                                                    .delete(e);
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                                size: 24,
                                                color: Colors.red[900],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
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
                                    color: const Color.fromARGB(
                                        255, 255, 246, 189),
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
            const SizedBox(height: 40)
          ],
        ),
      ),
    );
  }
}
