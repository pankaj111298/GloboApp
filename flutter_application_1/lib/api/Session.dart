class Session {
  late int id;
  late String description;
  late int duration;
  late String date;

  Session() {
    this.id = 0;
    this.description = '';
    this.duration = 0;
    this.date = '';
  }

  Session.fromJson(Map<String, dynamic> session) {
    this.id = session['id'];
    this.description = session['description'];
    this.date = session['date'];
    this.duration = session['duration'];
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
