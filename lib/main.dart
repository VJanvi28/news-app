import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'news_list.dart';
import 'news_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsService(),
      child: MaterialApp(
        title: 'News App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: NewsListScreen(),
      ),
    );
  }
}
