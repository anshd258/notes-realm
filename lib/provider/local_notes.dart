import 'package:flutter/material.dart';
import 'package:notes/model/local_notes_struct.dart';
import 'package:notes/main.dart';
import 'package:realm/realm.dart';

class LocalNotesProvider with ChangeNotifier {
  late final Realm localRealm;

  RealmResults<LocalNoteStruct>? notes;

  void create(String data, String uuid) {
    localRealm.write(() {
      localRealm.add(
          LocalNoteStruct(ObjectId(), uuid, DateTime.now(), content: data));
    });
    notifyListeners();
  }

  void intialize( User user) {
   
     
   
      final configLocal = Configuration.local([LocalNoteStruct.schema]);
      localRealm = Realm(configLocal);
    

    notes = localRealm.all<LocalNoteStruct>();
    notifyListeners();
  }

  void delete(LocalNoteStruct e) {
    localRealm.write(() => localRealm.delete(e));
    notifyListeners();
  }

  void update(String data, String id) {
    final note = notes!.firstWhere((element) => element.uuid == id);
    localRealm.write(() => note.content = data);
    notifyListeners();
  }
}
