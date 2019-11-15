import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future postTweet() async {
  final response = await http.post('http://0.0.0.0:5000/', body: 'nani');
  return response.body;
}

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.clear),
          tooltip: 'Volver',
          color: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          ButtonTheme(
            height: 5,
            child: RaisedButton(
              child: Text(
                'Tweet',
                style: TextStyle(fontSize: 16),
              ),
              color: Colors.lightBlue,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: () {
                postTweet().then((value) => print(value));
              },
            ),
          ),
        ],
      ),
      body: Container(
        child: TextField(
          //controller: ,
          decoration: InputDecoration(
            //border: OutlineInputBorder(),
            labelText: 'Escribe lo que estas pensando',
        ),
      ),
    ));
  }
}
