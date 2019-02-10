import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search;
  int _offset = 25;
  String _language = "pt";

  Future<Map> _getGifs() async {
    http.Response res;
    String url;
    String _key = "LvxUGhberJnqHgrotovwUVWjnOKLl2Sv";
    int _limit = 25;

    if (_search == null) {
      url =
          "https://api.giphy.com/v1/gifs/trending?api_key=$_key&limit=$_limit";
      res = await http.get(url);
    } else {
      url =
          "https://api.giphy.com/v1/gifs/search?api_key=$_key&q=&limit=$_limit&offset=$_offset&rating=G&lang=$_language";
      res = await http.get(url);
    }
    return json.decode(res.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getGifs().then((map) {
      print(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network(
            "https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                  labelText: "Pesquise aqui",
                  labelStyle: TextStyle(color: Colors.white)),
              style: TextStyle(color: Colors.white, fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
