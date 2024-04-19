import 'package:flutter/material.dart';
import 'package:testlab4/activities/api_page.dart';
import 'package:sqflite/sqflite.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPage();
}
  class _FeedbackPage extends State<FeedbackPage> {

  final text_controller = TextEditingController();

  @override
  void dispose() {
    text_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lab4 FeedbackPage")),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
              controller: text_controller,
            ),

            ElevatedButton(
              onPressed: () async
              { 
                DatabaseHelper db_helper = DatabaseHelper();
                try {
                  db_helper.createTable();
                  db_helper.insertFeedback(text_controller.text);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Feedback was saved!"),
                  ));
                } catch(e) {
                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Failed to save the feedback!"),
                ));}
              },
              child: const Text("Send feedback"),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
          height: 50,
          margin: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const APIPage()),
                    );
                  },
                  child: const Text('Back')),
            ],
          )
      ),
    );
  }
}

class DatabaseHelper {
  static String db_name = "feedback.db";
  
  void createTable() async {
    try {
      final db = await openDatabase(db_name);
      await db.execute(
        'CREATE TABLE feedback_table(feedback VARCHAR)');
    } catch (e) {
      print(e);
      }
  }

  void insertFeedback(String feedback) async {
    Map<String, dynamic> row = {
      'feedback': feedback,
    };
    try {
      final db = await openDatabase(db_name);
      await db.insert('feedback_table', row);
    } catch(e) {
      print(e);
    }
  }
}
