import 'package:flutter/material.dart';
import 'package:notes/model/notes_struct.dart';
import 'package:notes/provider/local_notes.dart';
import 'package:notes/screens/addLocal.dart';
import 'package:notes/screens/notepage.dart';
import 'package:notes/screens/page1.dart';
import 'package:realm/realm.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'model/local_notes_struct.dart';
import 'provider/notes_provider.dart';
import 'package:provider/provider.dart';
import 'package:notes/screens/login.dart';
import 'package:notes/screens/splash.dart';

late final Realm realm;
late final Realm localRealm;

void main() async {
  //connection with altas
  final app = App(AppConfiguration("notes-app-rzwgm"));

  //check user login status
  final user = app.currentUser ?? await app.logIn(Credentials.anonymous());

  //stabilise local database
  final configLocal = Configuration.local([LocalNoteStruct.schema]);
  localRealm = Realm(configLocal);

  //stabilise flexible sync
  final config = Configuration.flexibleSync(user, [NoteStruct.schema]);
  realm = Realm(config);

  // Add subscription to sync all NoteStruct objects in the realm
  realm.subscriptions.update((mutableSubscriptions) {
    mutableSubscriptions.add(realm.all<NoteStruct>());
  });

  // Sync all subscriptions
  await realm.subscriptions.waitForSynchronization();
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NotesProvider>(
          create: (_) => NotesProvider(),
        ),
        ChangeNotifierProvider<LocalNotesProvider>(
          create: (_) => LocalNotesProvider(),
        ),
      ],
      child: ResponsiveSizer(
        builder: ((context, orientation, deviceType) {
          return MaterialApp(
            initialRoute: "/",
            routes: {
              '/': (context) => const Splash(),
              '/page1': (context) => const Page1(),
              '/notespage': (context) => const Page2(),
              '/addLocal': (context) => const LocalNotes(),
              '/login': (context) => const LoginPage(),
            },
            debugShowCheckedModeBanner: false,
          );
        }),
      ),
    );
  }
}
