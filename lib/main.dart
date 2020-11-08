import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Provider'),
        ),
        body: MainUi(),
      ),
    );
  }
}

class MainUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyLabel(),
          TextField(
            decoration:
                InputDecoration(hintText: 'Enter a text to update the Label'),
          ),
        ],
      ),
    );
  }
}

class MyLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 100,
        child: Center(child: Text('My label')),
      ),
    );
  }
}
