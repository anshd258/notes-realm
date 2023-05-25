// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_notes_struct.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class LocalNoteStruct extends _LocalNoteStruct
    with RealmEntity, RealmObjectBase, RealmObject {
  LocalNoteStruct(
    ObjectId id,
    String uuid,
    DateTime date, {
    String? content,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'uuid', uuid);
    RealmObjectBase.set(this, 'date', date);
    RealmObjectBase.set(this, 'content', content);
  }

  LocalNoteStruct._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get uuid => RealmObjectBase.get<String>(this, 'uuid') as String;
  @override
  set uuid(String value) => throw RealmUnsupportedSetError();

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
  Stream<RealmObjectChanges<LocalNoteStruct>> get changes =>
      RealmObjectBase.getChanges<LocalNoteStruct>(this);

  @override
  LocalNoteStruct freeze() =>
      RealmObjectBase.freezeObject<LocalNoteStruct>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(LocalNoteStruct._);
    return const SchemaObject(
        ObjectType.realmObject, LocalNoteStruct, 'LocalNoteStruct', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('uuid', RealmPropertyType.string),
      SchemaProperty('date', RealmPropertyType.timestamp),
      SchemaProperty('content', RealmPropertyType.string, optional: true),
    ]);
  }
}
