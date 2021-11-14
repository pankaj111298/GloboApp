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
}
