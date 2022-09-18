import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() {
  String apiKey = "b59232891b8a45ef88cad6758ba04c5c";
  var newNews = [];

  // ignore: non_constant_identifier_names
  get_news() async {
    var url = Uri.https(
        'newsapi.org', '/v2/everything', {'q': 'bitcoin', 'apiKey': apiKey});
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var newsList = jsonResponse['articles'];
      newsList.forEach((item) {
        print(newsList);
        newNews.add({
          'title': item['title'],
          'description': item['description'],
          'image_link': item['urlToImage'],
          'author':item['author'],
          'content':item['content'],
          'publishedAt':item['publishedAt'],
        });
        print('\n');
      });
      print(newNews);
      print("\n");
      print(newNews[2]['content']);
    }
  }

  get_news();
}
