import 'package:flutter/material.dart';
import 'package:notes/model/notes_struct.dart';
import 'package:notes/main.dart';
import 'package:realm/realm.dart';

class NotesProvider with ChangeNotifier {
  late final Realm syncRealm;
  RealmResults<NoteStruct>? syncNotes;
  bool isFlexibleSync = true;

  void create(String data, String uuid) {
    syncRealm.write(() {
      syncRealm.add(NoteStruct(uuid, DateTime.now(), content: data));
    });
    notifyListeners();
  }

  void intialize(User user) async {
    final configLocal = Configuration.flexibleSync(user, [NoteStruct.schema]);
    syncRealm = Realm(configLocal);

    syncRealm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(syncRealm.all<NoteStruct>());
    });

// Sync all subscriptions
    await syncRealm.subscriptions.waitForSynchronization();

    syncNotes = syncRealm.all<NoteStruct>();
    notifyListeners();
  }

  Future<void> pauseRealm() async {
    if (isFlexibleSync) {
      syncRealm.syncSession.resume();
    } else {
      syncRealm.syncSession.pause();
    }
  }

  set sync(bool value) {
    isFlexibleSync = value;
    notifyListeners();
  }

  void delete(NoteStruct e) {
    syncRealm.write(() => syncRealm.delete(e));
    notifyListeners();
  }

  void update(String data, String id) {
    final note = syncNotes!.firstWhere((element) => element.id == id);
    syncRealm.write(() => note.content = data);
    notifyListeners();
  }
}
