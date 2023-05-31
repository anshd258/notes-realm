import 'package:flutter/material.dart';
import 'package:notes/provider/local_notes.dart';
import 'package:notes/provider/loginRealm.dart';
import 'package:notes/provider/notes_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:notes/model/colour.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:notes/main.dart';
import 'package:notes/provider/theme_provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // TODO load these values
  bool isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    bool isFlexibleSync = context.watch<NotesProvider>().isFlexibleSync;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: backgroundGradient,
            ),
          ),
          child: Column(children: [
            const SizedBox(
              height: 110,
            ),
            SwitchListTile(
              secondary: const Icon(Icons.brightness_low, color: Colors.white),
              value: isDarkTheme,
              title: Text(
                "Change Theme",
                style: TextStyle(fontSize: 20.sp, color: Colors.white),
              ),
              onChanged: _onThemeChange,
            ),
            SwitchListTile(
              secondary: const Icon(Icons.sync, color: Colors.white),
              value: isFlexibleSync,
              title: Text(
                "Flexible Sync",
                style: TextStyle(fontSize: 20.sp, color: Colors.white),
              ),
              onChanged: _onFlexibleSyncChange,
            ),
            // ListTile(
            //   leading: const Icon(Icons.person),
            //   trailing: const Icon(Icons.logout),
            //   title: Text(
            //     "Logout",
            //     style: TextStyle(fontSize: 20.sp),
            //   ),
            //   onTap: _logout,
            // ),
          ]),
        ),
      ),
    );
  }

  // TODO implement these functions
  void _onFlexibleSyncChange(bool newValue) async {
    context.read<NotesProvider>().sync = newValue;
    context.read<NotesProvider>().pauseRealm();
    setState(() {});
  }

  void _logout() {}

  void _onThemeChange(bool value) {
    context.read<AppTheme>().isDark = value;
  }
}
