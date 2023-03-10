import 'package:realm/realm.dart';

part "notesStruct.g.dart";

@RealmModel()
class _NoteStruct{
  @PrimaryKey()
  @MapTo('_id')
  late String id;
  late DateTime date;
  late String? content;
}