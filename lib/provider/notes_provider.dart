import 'package:flutter/material.dart';
import 'package:notes/model/notes_struct.dart';
import 'package:notes/main.dart';

class NotesProvider with ChangeNotifier {
  final notes = realm.all<NoteStruct>();

  void create(String data, String uuid) {
    realm.write(() {
      realm.add(NoteStruct(uuid, DateTime.now(), content: data));
    });
    notifyListeners();
  }

  void delete(NoteStruct e) {
    realm.write(() => realm.delete(e));
    notifyListeners();
  }

  void update(String data, String id) {
    final note = notes.firstWhere((element) => element.id == id);
    realm.write(() => note.content = data);
    notifyListeners();
  }
}
