import 'package:flutter/material.dart';
import 'package:notes/model/notes_struct.dart';
import 'package:notes/screens/notepage.dart';
import 'package:notes/screens/page1.dart';
import 'package:realm/realm.dart';
import 'package:sizer/sizer.dart';
import 'provider/notes_provider.dart';
import 'package:provider/provider.dart';

late final Realm realm;

void main() async {
  //connection with altas
  final app = App(AppConfiguration("notes-app-rzwgm"));

  //check user login status
  final user = app.currentUser ?? await app.logIn(Credentials.anonymous());

  //stabilise flexible sync
  final config = Configuration.flexibleSync(user, [NoteStruct.schema]);
  realm = Realm(config);

  // Add subscription to sync all NoteStruct objects in the realm
  realm.subscriptions.update((mutableSubscriptions) {
    mutableSubscriptions.add(realm.all<NoteStruct>());
  });

  // Sync all subscriptions
  // await realm.subscriptions.waitForSynchronization();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NotesProvider>(
      create: (context) => NotesProvider(),
      child: Sizer(
        builder: ((context, orientation, deviceType) {
          return MaterialApp(
            initialRoute: "/",
            routes: {
              '/': (context) => const Page1(),
              '/notespage': (context) => const Page2()
            },
            debugShowCheckedModeBanner: false,
          );
        }),
      ),
    );
  }
}
