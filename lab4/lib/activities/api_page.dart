import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:testlab4/activities/feedback_page.dart';
import 'package:testlab4/activities/main_page.dart';
import 'package:http/http.dart' as http;
import 'package:testlab4/activities/models/post_model.dart';

class APIPage extends StatefulWidget {
  const APIPage({super.key});

  @override
  _State createState() => _State();
}

class _State extends State<APIPage> {

  late String joke = "Chuck Norris joke";

  Future<PostModel> fetchJoke() async {
    final response = await http
        .get(Uri.parse('https://api.chucknorris.io/jokes/random'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return PostModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load PostModel');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lab4 APIPage")),
      body: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Text(
              joke,
            ),

            ElevatedButton(
              onPressed: () async {
                try {
                  String temp = await fetchJoke().then((value) => value.value);
                  setState(() {
                    joke = temp;
                  });
                } catch(e) {
                  print(e);
                }
              },
              child: const Text("Get Chuck Norris joke"),
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
                      MaterialPageRoute(builder: (context) => const MainPage()),
                    );
                  },
                  child: const Text('Back')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FeedbackPage()),
                    );
                  },
                  child: const Text('Next')),
            ],
          )
      ),
    );
  }
}
