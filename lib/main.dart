import 'dart:convert';

import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
      home: new HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Person"),
      ),
      body: new Container(
        child: new Center(
          child: new FutureBuilder(
            future: DefaultAssetBundle
                .of(context)
                .loadString('load_json/person.json'),
            builder: (context, snapshot) {
              var mydata = JSON.decode(snapshot.data.toString());

              return new ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return new Card(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new Text(
                          "Name:" + mydata[index]['name'],
                          style: new TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 25.0,
                              color: Colors.red,
                              fontWeight: FontWeight.w400),
                        ),
                        new Text("Age:" + mydata[index]['age']),
                        new Text("Degree:" + mydata[index]['college']),
                      ],
                    ),
                    color: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                      side: BorderSide.none,
                    ),
                  );
                },
                itemCount: mydata == null ? 0 : mydata.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
