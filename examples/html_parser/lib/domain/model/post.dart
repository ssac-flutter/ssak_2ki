import 'package:html/parser.dart';

class Post {
  String title;
  String caption;
  String url1;
  String url2;

  Post({
    required this.title,
    required this.caption,
    required this.url1,
    required this.url2,
  });

  factory Post.parse(String html) {
    var document = parse(html);

    String title = document.getElementsByTagName('p').first.text;
    String caption = document.getElementsByTagName('figcaption').first.text;
    String url1 = document.querySelector('img')!.attributes['src']!;
    String url2 = document.querySelectorAll('img')[1].attributes['src']!;

    return Post(
      title: title,
      caption: caption,
      url1: url1,
      url2: url2,
    );
  }
}
