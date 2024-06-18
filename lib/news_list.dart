import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'news_service.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: FutureBuilder(
        future: newsService.fetchNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: newsService.articles.length,
              itemBuilder: (context, index) {
                final article = newsService.articles[index];
                return ListTile(
                  title: Text(article.title),
                  subtitle: Text(article.description ?? ''),
                );
              },
            );
          }
        },
      ),
    );
  }
}
