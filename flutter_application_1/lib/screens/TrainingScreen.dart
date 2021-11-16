import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/SP_helper.dart';
import 'package:flutter_application_1/api/Session.dart';
import 'package:flutter_application_1/navigation/BottomNavigation.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({Key? key}) : super(key: key);

  @override
  _TrainingScreenState createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  List<Session> sessions = [];
  final description = TextEditingController();
  final duration = TextEditingController();
  SP_helper helper = new SP_helper();

  @override
  void initState() {
    helper.init().then((value) => updateScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Training Sessions"),
      ),
      bottomNavigationBar: BottomNavigation(),
      body: ListView(
        children: getContent(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showSessionDialog(context);
        },
      ),
    );
  }

  List<Widget> getContent() {
    List<Widget> tiles = [];
    sessions.forEach((session) {
      tiles.add(ListTile(
        title: Text(session.description),
        subtitle: Text('${session.date}- duration:${session.duration} min'),
      ));
    });
    return tiles;
  }

  void updateScreen() {
    sessions = helper.getSessions();
  }

  Future showSessionDialog(BuildContext context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Insert Training Session"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: description,
                    decoration: InputDecoration(hintText: 'Description'),
                  ),
                  TextField(
                    controller: duration,
                    decoration: InputDecoration(hintText: 'Duration'),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    description.text = '';
                    duration.text = '';
                  },
                  child: Text("Cancel")),
              ElevatedButton(onPressed: saveSession, child: Text("Save"))
            ],
          );
        });
  }

  Future saveSession() async {
    DateTime now = DateTime.now();
    String today = '${now.year}-${now.month}-${now.day}';

    Session session = new Session();
    session.id = 1;
    session.date = today;
    session.description = description.text;
    session.duration = int.parse(duration.text);
    helper.writeSession(session);
    description.text = '';
    duration.text = '';
  }
}
