import 'package:flutter_test/flutter_test.dart';
import 'package:html/parser.dart' show parse;
import 'package:html_parser/domain/model/post.dart';

void main() {
  test('HTML 파싱', () async {
    var document = parse(fakeHtml);

    String title = document.getElementsByTagName('p').first.text;
    String caption = document.getElementsByTagName('figcaption').first.text;
    String url1 = document.querySelector('img')!.attributes['src']!;
    String url2 = document.querySelectorAll('img')[1].attributes['src']!;

    expect(title, '테스트 1');
    expect(caption, '이것은 테스트 1 입니다.');
    expect(url1, 'https://virtureart.shop/wp-content/uploads/2021/11/pngegg.png');
    expect(url2, 'https://virtureart.shop/wp-content/uploads/2021/11/20210402_162336_358001-1.jpg');
  });

  test('Post.parse 테스트', () {
    Post post = Post.parse(fakeHtml);

    expect(post.title, '테스트 1');
    expect(post.caption, '이것은 테스트 1 입니다.');
    expect(post.url1, 'https://virtureart.shop/wp-content/uploads/2021/11/pngegg.png');
    expect(post.url2, 'https://virtureart.shop/wp-content/uploads/2021/11/20210402_162336_358001-1.jpg');
  });
}

const fakeHtml = """
        <p>테스트 1</p>
<figure class="wp-block-image size-full"><img loading="lazy" width="512" height="512"
    src="https://virtureart.shop/wp-content/uploads/2021/11/pngegg.png" alt="" class="wp-image-7" srcset="https://virtureart.shop/wp-content/uploads/2021/11/pngegg.png 512w,
    https://virtureart.shop/wp-content/uploads/2021/11/pngegg-300x300.png 300w,
    https://virtureart.shop/wp-content/uploads/2021/11/pngegg-100x100.png 100w,
    https://virtureart.shop/wp-content/uploads/2021/11/pngegg-150x150.png 150w" sizes="(max-width: 512px) 100vw,
    512px" />
  <figcaption>이것은 테스트 1 입니다.</figcaption>
</figure>
<figure class="wp-block-image size-full"><img loading="lazy" width="640" height="424"
    src="https://virtureart.shop/wp-content/uploads/2021/11/20210402_162336_358001-1.jpg" alt="" class="wp-image-3070"
    srcset="https://virtureart.shop/wp-content/uploads/2021/11/20210402_162336_358001-1.jpg
    640w, https://virtureart.shop/wp-content/uploads/2021/11/20210402_162336_358001-1-300x199.jpg 300w,
    https://virtureart.shop/wp-content/uploads/2021/11/20210402_162336_358001-1-600x398.jpg 600w" sizes="(max-width:
    640px) 100vw, 640px" />
</figure>
        """;
