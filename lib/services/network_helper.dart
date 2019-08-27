import 'package:http/http.dart' as http;
import 'dart:convert' as converter;
class NetworkHelper{
  final String url;
  NetworkHelper({this.url});
  Future getData() async{
    http.Response response = await http.get(
      Uri.encodeFull(url),
      headers: {"Accept":"application/json"}
    );
    if(response.statusCode == 200){
      String data = response.body;
      var decodedData = converter.json.decode(data);
      return decodedData;
    } else{
      print(response.statusCode);
    }
  }
}