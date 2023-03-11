// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_struct.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class NoteStruct extends _NoteStruct
    with RealmEntity, RealmObjectBase, RealmObject {
  NoteStruct(
    String id,
    DateTime date, {
    String? content,
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'date', date);
    RealmObjectBase.set(this, 'content', content);
  }

  NoteStruct._();

  @override
  String get id => RealmObjectBase.get<String>(this, '_id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, '_id', value);

  @override
  DateTime get date => RealmObjectBase.get<DateTime>(this, 'date') as DateTime;
  @override
  set date(DateTime value) => RealmObjectBase.set(this, 'date', value);

  @override
  String? get content =>
      RealmObjectBase.get<String>(this, 'content') as String?;
  @override
  set content(String? value) => RealmObjectBase.set(this, 'content', value);

  @override
  Stream<RealmObjectChanges<NoteStruct>> get changes =>
      RealmObjectBase.getChanges<NoteStruct>(this);

  @override
  NoteStruct freeze() => RealmObjectBase.freezeObject<NoteStruct>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(NoteStruct._);
    return const SchemaObject(
        ObjectType.realmObject, NoteStruct, 'NoteStruct', [
      SchemaProperty('id', RealmPropertyType.string,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('date', RealmPropertyType.timestamp),
      SchemaProperty('content', RealmPropertyType.string, optional: true),
    ]);
  }
}
