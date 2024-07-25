class ModelTodo {
  final int userId;
  final int id;
  final String title;
  final String body;

  ModelTodo({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory ModelTodo.fromJson(Map<String, dynamic> json) {
    return ModelTodo(
      userId: json['userId'] ?? 'N/A',
      id: json['id'] ?? 'N/A',
      title: json['title'] ?? 'N/A',
      body: json['body'] ?? 'N/A',
      // image: json['image']

    );
  }


}
