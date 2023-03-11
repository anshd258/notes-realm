import 'package:realm/realm.dart';

part "notes_struct.g.dart";

@RealmModel()
class _NoteStruct {
  @PrimaryKey()
  @MapTo('_id')
  late String id;
  late DateTime date;
  late String? content;
}
