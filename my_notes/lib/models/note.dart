class Note {
  int _id;
  int get id { return _id; }
  String title;
  String description;
  DateTime createdAt = DateTime.now();

  Note({ this.title, this.description });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map();
    map['title'] = title;
    map['description'] = description;
    map['createdAt'] = createdAt.millisecondsSinceEpoch.toString();
    return map;
  }

  static Note fromJSON(Map<String, dynamic> json) {
    Note note = Note(
      title: json['title'] ,
      description: json['description']
    );

    note._id = json['id'];
    note.createdAt = DateTime.fromMillisecondsSinceEpoch(json['createdAt']);
    return note;
  }
}
