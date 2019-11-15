import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'create_page.dart';
import 'tweet.dart';

Future<List<Tweet>> getTweets() async {
  final response = await http.get('http://0.0.0.0:5000/');
  Map<String, dynamic> tweets = json.decode(response.body)['tweets'];
  List<Tweet> list = [];
  tweets.forEach((key, value) {
    Tweet tweet = Tweet.fromJson(key, value);
    list.add(tweet);
  });
  return list;
}

class HomePage extends StatefulWidget {
  final Future<List<Tweet>> tweets;

  HomePage({this.tweets});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    getTweets();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: TextStyle(color: Colors.black)),
        leading: Icon(Icons.person, color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Tweet>>(
        future: widget.tweets,
        builder: (BuildContext context, AsyncSnapshot<List<Tweet>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Text('${snapshot.data[index].content }'
                );
              },
            );
          }
          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        tooltip: 'Increment',
        child: Icon(Icons.create),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreatePage()));
        },
      ),
    );
  }
}
