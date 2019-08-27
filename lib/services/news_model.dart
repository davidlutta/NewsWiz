import 'package:newswiz/constants.dart';
import 'package:newswiz/services/network_helper.dart';

class NewsModel{
  Future<dynamic> getNews(String category) async{
    String url = '$kBaseUrl$category$kApiKey';
    print(url);
    NetworkHelper helper = new NetworkHelper(url: url);
    return await helper.getData();
  }
}