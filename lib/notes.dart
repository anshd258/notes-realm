import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesCard extends StatefulWidget {
  const NotesCard({super.key});

  @override
  State<NotesCard> createState() => _NotesCardState();
}

class _NotesCardState extends State<NotesCard> {
  // LIST OF THE NOTES
  List notes = [
    {
      "date": "XX/XX/XXXX",
      "note": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    },
    {
      "date": "XX/XX/XXXX",
      "note":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    },
    {
      "date": "XX/XX/XXXX",
      "note":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    },
    {
      "date": "XX/XX/XXXX",
      "note":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    },
    {
      "date": "XX/XX/XXXX",
      "note":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    },
    {
      "date": "XX/XX/XXXX",
      "note":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(20),
          child: Column(
            // MAAPING THE ITEMS OF THE LIST IN CARDS
            children: notes.map((e) {
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
                                                  const Color.fromARGB(
                                                      226, 255, 255, 255),
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
                                                        Text(
                                                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                                          style: GoogleFonts
                                                              .ubuntu(
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 50,
                                                        ),
                                                        OutlinedButton(
                                                          onPressed: () {},
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
                                          size: 20,
                                          color: Colors.blue[900],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.delete,
                                          size: 20,
                                          color: Colors.red[900],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 1, 10, 10),
                                  child: Text(
                                    e['note'],
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
                            e['date'],
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
