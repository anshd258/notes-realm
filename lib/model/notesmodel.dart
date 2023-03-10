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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['uuid'] = this.uuid;
    data['note'] = this.note;
    return data;
  }
}
