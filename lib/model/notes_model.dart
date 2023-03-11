class NotesModel {
  String? date;
  String? uuid;
  String? note;

  NotesModel({this.date, this.uuid, this.note});

  NotesModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    uuid = json['uuid'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['uuid'] = uuid;
    data['note'] = note;
    return data;
  }
}
