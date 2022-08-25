import 'dart:convert';

import 'package:api_proj/model/Article.dart';
import 'package:http/http.dart';

class ApiService{
  final endpoint = "https://newsapi.org/v2/everything?q=tesla&from=2022-07-25&sortBy=publishedAt&apiKey=65acbceeb3c048a09d1da967d925568e";
  Future<List<Article>> getArticle() async{
    Response response = await get(Uri.parse(endpoint));
    if(response.statusCode == 200){
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;

    } else {
      throw 'Data not found';
    }

  }
}