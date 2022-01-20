class Posts{
  final int userId;
  final int id;
  final String title;
  final String body;

  Posts({
    required this.userId,
    required this.id,
    required this.title,
    required this.body
  });

  factory Posts.fromJson(Map<dynamic,dynamic> json){
    return new Posts(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']
    );
  }
}