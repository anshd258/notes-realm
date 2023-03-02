import 'package:flutter/material.dart';
import "../model/notesmodel.dart";
import 'package:uuid/uuid.dart';

class NotesProvider with ChangeNotifier {
  List<NotesModel> notes = [];
  var uuid = const Uuid();
  void addnote(String data) {
    notes.add(NotesModel(
        date: DateTime.now().toIso8601String(), note: data, uuid: uuid.v4()));
    notifyListeners();
  }

  void deletenode(NotesModel data) {
    notes.remove(data);
    notifyListeners();
  }

  void updatenote(String data, String obj) {
    notes.firstWhere((element) => element.uuid == obj).note = data;
    notifyListeners();
  }
}
