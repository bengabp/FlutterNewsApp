// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors
import 'package:flutter/material.dart';
import './newstile.dart';
import './search_bar.dart';

// ignore: must_be_immutable
class Search extends StatelessWidget {
  List<dynamic> news = [];

  // ignore: prefer_typing_uninitialized_variables, non_constant_identifier_names
  var get_news;
  // ignore: prefer_typing_uninitialized_variables
  var loading;

  Search(this.news, this.get_news, this.loading);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          const Icon(Icons.menu_book_outlined),
        ],
      ),
      body: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: loading != true
            ? [
                SearchBar(get_news),
                ...news.map((e) {
                  return NewsTile(e, context);
                }).toList(),
                // ignore: avoid_unnecessary_containers
              ]
            : [
                SearchBar(get_news),
                Container(
                  padding: EdgeInsets.all(100.0),
                  child: Center(
                    child: CircularProgressIndicator(
                      value: null,
                      strokeWidth: 5.0,
                      backgroundColor: Colors.lightBlueAccent,
                      color:Colors.blue,
                    ),
                  ),
                )
              ],
      ),
    );
  }
}
