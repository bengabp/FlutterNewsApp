// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class NewsDetails extends StatelessWidget {
  var title;
  var image_link;
  var news_item;
  var description;
  var publishedAt;
  var url;

  // ignore: use_key_in_widget_constructors, non_constant_identifier_names
  NewsDetails(news_item) {
    title = news_item['title'];
    image_link = news_item['image_link'];
    description = news_item['description'];
    publishedAt = news_item['publishedAt'];
    url = news_item['url'];
  }

  void launchURL() async {
    if (!await launch(url,forceWebView: true,enableDomStorage: true,enableJavaScript: true)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: [
          Image.network(
            image_link,
            fit: BoxFit.fill,
            height: 200.0,
          ),
          Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    title,
                    style: TextStyle(
                        fontFamily: 'monospace',
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                    textAlign: TextAlign.center,
                  )),
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.access_time_rounded,
                          color: Colors.blue, size: 30.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Published At \n$publishedAt",
                          style: TextStyle(
                              fontFamily: 'monospace',
                              fontWeight: FontWeight.w100,
                              color: Colors.blue,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    description,
                    style: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  )),
              Padding(
                child: Text(
                  "Read more..",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.lightBlue,
                      fontFamily: 'monospace'),
                ),
                padding: EdgeInsets.all(5.0),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: TextButton(
                  onPressed: launchURL,
                  child: Text(
                    url,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'monospace',
                        color: Colors.lightBlueAccent),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
