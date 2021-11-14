class Session {
  late int id;
  late String description;
  late int duration;
  late String date;

  Session() {
    this.date = date;
    this.id = id;
    this.description = description;
    this.duration = duration;
  }

  Session.fromJson(Map<String, dynamic> session) {
    this.id = session['id'];
    this.description = session['name'];
    this.date = date;
    this.duration = duration;
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'duration': duration,
      'date': date
    };
  }
}
