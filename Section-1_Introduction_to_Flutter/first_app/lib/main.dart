import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('This is First App')),
        body: Container(
          color: Colors.green,
          child: Center(
            child: Text(
              'Hello From First app',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    ),
  );
}
