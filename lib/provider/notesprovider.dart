import 'package:flutter/material.dart';
import "../model/notesmodel.dart";
import 'package:uuid/uuid.dart';

class NotesProvider with ChangeNotifier {
  List<NotesModel> notes = [];
  var uuid = const Uuid();

}
