import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchBar extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables, non_constant_identifier_names
  var get_news;

  // ignore: use_key_in_widget_constructors
  SearchBar(this.get_news);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: TextField(
        decoration: const InputDecoration(
            icon: Icon(
              Icons.search,
              size: 35.0,
            ),
            helperText: "Search news...",
            helperStyle: TextStyle(
                fontSize: 15,
                fontFamily: 'monospace',
                fontWeight: FontWeight.bold),
            contentPadding: EdgeInsets.all(10.0)),
        cursorHeight: 30.0,
        cursorColor: Colors.black,
        cursorWidth: 3.0,
        style: TextStyle(
            foreground: Paint(), fontSize: 23, fontFamily: 'monospace'),
        onSubmitted: get_news,
      ),
    );
  }
}
