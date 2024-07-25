import 'package:flutter/cupertino.dart';
import 'package:food_ordering_app/Models/model_todo.dart';
import 'package:food_ordering_app/services/todo_services.dart';

class TodoProvider extends ChangeNotifier{

  TodoServices _services = TodoServices();
  List<ModelTodo> _todo = [];
  bool isLoading =false;
  List<ModelTodo> get todos => _todo;

  Future<void> getAllTodos() async{
    isLoading =true;
    notifyListeners();

    final response = await _services.getAll();
    _todo = response;
    isLoading=false;
    notifyListeners();
  }

}