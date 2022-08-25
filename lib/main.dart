import 'package:api_proj/Service/api_service.dart';
import 'package:flutter/material.dart';

import 'model/Article.dart';

void main()
{
  runApp(const MyAapp());
}
class MyAapp extends StatelessWidget {
  const MyAapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('News API'),
      ),
      body: FutureBuilder(
        future:apiService.getArticle() ,
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot){
         if(snapshot.hasData){
           return Text("hareee");
         }
         return CircularProgressIndicator();
        }
      ),
    );
  }
}
