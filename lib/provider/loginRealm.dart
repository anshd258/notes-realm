import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

class LoginRealm with ChangeNotifier {
  final app = App(AppConfiguration("notes-realm-dmfux"));
  late User? user;

  Future login() async {
    try {
      await app.logIn(Credentials.anonymous());
      user = app.currentUser;
      notifyListeners();
      return user;
    } catch (e) {
      throw ('error logging in');
    }
  }
}
