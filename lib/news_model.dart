class Article {
  final String title;
  final String? description;

  Article({
    required this.title,
    this.description,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'],
      description: json['description'],
    );
  }
}
