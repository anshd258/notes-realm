import 'package:realm/realm.dart';

part "local_notes_struct.g.dart";

@RealmModel()
class _LocalNoteStruct {
  @PrimaryKey()
  late ObjectId id;

  late final String uuid;
  late DateTime date;
  late String? content;
}
