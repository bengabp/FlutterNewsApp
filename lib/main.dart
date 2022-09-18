// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, non_constant_identifier_names, use_key_in_widget_constructors, prefer_final_fields
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/search.dart';
import 'dart:convert' as convert;

void main() {
  return runApp(NewsApp());
}

// ignore: must_be_immutable
class NewsApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<NewsApp> {
  List<dynamic> news = [];

  String api_key = "b59232891b8a45ef88cad6758ba04c5c";
  var new_news = [];
  bool loading = false;


  get_news(String searchKeyword) async {
    var url = Uri.https(
        'newsapi.org', '/v2/everything', {'q': searchKeyword, 'apiKey': api_key});
    // Await the http get response, then decode the json-formatted response.
    setState(() {
      loading = true;
    });
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var newsList = jsonResponse['articles'];
      new_news = [];
      newsList.forEach((item) {
        new_news.add({
          'title': item['title'],
          'description': item['description'],
          'image_link': item['urlToImage'],
          'publishedAt':item['publishedAt'],
          'url':item['url'],
        });
      });
      print(new_news);
      setState(() {
        loading = false;
        news = new_news;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Search(news,get_news,loading)
    );
  }
}
