import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'HEY',
          ),
          centerTitle: true,
          backgroundColor: Colors.pink[100],
        ),
        backgroundColor: Colors.pink[50],
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 2.0,
              ),
              TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: 'Enter your Email',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink, width: 1.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: 'Enter your Password',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink, width: 1.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
