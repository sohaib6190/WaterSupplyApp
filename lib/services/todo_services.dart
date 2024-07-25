import 'dart:convert';

import 'package:food_ordering_app/Models/model_todo.dart';
import 'package:http/http.dart' as http;
class TodoServices{
  Future<List<ModelTodo>> getAll() async {
    const url = 'http://jsonplaceholder.typicode.com/posts';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<ModelTodo> model_todo_list = body.map((dynamic item) => ModelTodo.fromJson(item)).toList();
      return model_todo_list;
    } else {
      throw Exception('Failed to load categories');
    }

  }
}