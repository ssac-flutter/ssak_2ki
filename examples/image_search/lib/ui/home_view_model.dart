import 'package:http/http.dart';
import 'package:image_search/data/pixabay_api.dart';
import 'package:image_search/model/hits.dart';

class HomeViewModel {
  final _api = PixabayApi();

  Future<List<Hits>> getImage(String query, {Client? client}) async {
    if (client == null) {
      client = Client();
    }
    return await _api.getImages(client, query);
  }
}
