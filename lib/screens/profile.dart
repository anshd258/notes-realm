import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // TODO load these values
  bool isDarkTheme = false;
  bool isFlexibleSync = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          SwitchListTile(
            secondary: const Icon(Icons.brightness_low),
            value: isDarkTheme,
            title: Text(
              "Change Theme",
              style: TextStyle(fontSize: 20.sp),
            ),
            onChanged: _onThemeChange,
          ),
          SwitchListTile(
            secondary: const Icon(Icons.sync),
            value: isFlexibleSync,
            title: Text(
              "Flexible Sync",
              style: TextStyle(fontSize: 20.sp),
            ),
            onChanged: _onFlexibleSyncChange,
          ),
          ListTile(
            leading: const Icon(Icons.person),
            trailing: const Icon(Icons.logout),
            title: Text(
              "Logout",
              style: TextStyle(fontSize: 20.sp),
            ),
            onTap: _logout,
          ),
        ]),
      ),
    );
  }

  // TODO implement these functions
  void _onFlexibleSyncChange(bool newValue) {}

  void _logout() {}

  void _onThemeChange(bool newValue) {}
}
