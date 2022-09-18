// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'news_details.dart';

// ignore: must_be_immutable
class NewsTile extends StatelessWidget {
  var context;
  var text;
  var image_link;
  var news_item;

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  NewsTile(this.news_item, this.context, ){
    text = news_item['title'];
    image_link = news_item['image_link'];
    print(image_link);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    image_link ??=
        "http://whatcommasoniclodge.org/wp-content/uploads/2016/12/112815904-stock-vector-no-image-available-icon-flat-vector-illustration.jpg";
    return Card(
      color: Colors.white70,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(30),
      )),
      elevation: 3.0,
      margin: const EdgeInsets.only(left: 10, top: 30, right: 10, bottom: 5.0),
      child: Column(
        children: [
          Container(
            child: Image.network(image_link),
            margin: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
          ),
          Container(
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(5.0),
            child: TextButton(
              onPressed: () {
                  print('News which has a title of "$text" has being clicked');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewsDetails(news_item)),
                  );

              },
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    height: 2.0,
                    fontFamily: 'monospace'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
