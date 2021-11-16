import 'Session.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SP_helper {
  static late SharedPreferences preferences;

  Future init() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future writeSession(Session session) async {
    preferences.setString(session.id.toString(), json.encode(session.toJson()));
  }

  List<Session> getSessions() {
    List<Session> sessions = [];
    Set<String> keys = preferences.getKeys();
    keys.forEach((String key) {
      Session session =
          Session.fromJson(json.decode(preferences.getString(key) ?? ''));
      sessions.add(session);
    });
    return sessions;
  }
}
