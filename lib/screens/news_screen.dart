import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:newswiz/constants.dart';
import 'package:newswiz/services/news_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
String title;
String author;
String urlToSite;
String imageUrl;
String description;
class NewsScreen extends StatefulWidget {
  final String category;
  NewsScreen({@required this.category});
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  FlutterWebviewPlugin flutterWebviewPlugin = new FlutterWebviewPlugin();
  Map data;
  List news;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getNews(widget.category);
  }
  Future getNews(String category) async{
    String url = '$kBaseUrl$category$kApiKey';
    http.Response response = await http.get(url);
    if(response.statusCode == 200){
      data = json.decode(response.body);
      setState(() {
        news=data["articles"];
      });
    } else{
      print(response.statusCode);
    }
  }
  WebviewScaffold openWebView(String url){
    return WebviewScaffold(
      url: url,
      appCacheEnabled: true,
      withJavascript: true,
    );
  }

  @override
  void dispose() {
    super.dispose();
    flutterWebviewPlugin.close();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: news == null ? 0 : news.length,
        itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                flutterWebviewPlugin.launch(news[index]['url'],
                scrollBar: true,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(news[index]['urlToImage']),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black26, BlendMode.darken),
                    ),
                    borderRadius: BorderRadius.circular(10.0)
                ),
                constraints: BoxConstraints.expand(height: MediaQuery.of(context).size.height),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    Text(
                      '${news[index]['title']}',
                      style: kDisplayTextStyle,
                  ),
                 Text(
                    news[index]['author'],
                    style: kAuthorTextStyle,
                  ),
                  Text(
                    news[index]['description'],
                  style: kDescriptionTextStyle,
                  )
                ],
              ),
          ),
          ),
            ),
          );
        },
      ),
    );
  }
}
