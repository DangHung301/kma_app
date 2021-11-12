import 'package:kma_app/Helper/extention/map_parse.dart';

class SlideNews {
  int id;
  String title;
  String image;
  String url;

  SlideNews(
      {required this.id,
      required this.title,
      required this.image,
      required this.url});

  factory SlideNews.fromJson(Map<String, dynamic> json) {
    return SlideNews(
        id: json.intValue('id'),
        title: json.stringValueOrEmpty('title'),
        image: json.stringValueOrEmpty('image'),
        url: json.stringValueOrEmpty('url'));
  }
}
