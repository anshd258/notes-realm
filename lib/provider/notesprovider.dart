import 'package:flutter/material.dart';
import "../model/notesmodel.dart";
import 'package:uuid/uuid.dart';

class NotesProvider with ChangeNotifier {
  List<NotesModel> notes = [];
  var uuid = const Uuid();

  void createNote(String data) {
    print(uuid.v4());
    notes.add(NotesModel(
        date: DateTime.now().toIso8601String(), note: data, uuid: uuid.v4()));
    notifyListeners();
  }

  void deleteNote(NotesModel data) {
    notes.remove(data);
    notifyListeners();
  }

  void updateNote(String data, String obj) {
    notes.firstWhere((element) => element.uuid == obj).note = data;
    notifyListeners();
  }
}
