import 'package:flutter/material.dart';
import 'package:food_ordering_app/provider/todo_provider.dart';
import 'package:provider/provider.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp){
      Provider.of<TodoProvider>(context,listen: false).getAllTodos();
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TodoProvider>(
        builder: ( context,value,child) {
        final todos =value.todos;
      return ListView.builder(
          itemCount:todos.length ,
          itemBuilder: (context,index){
            final todo = todos[index];
        return ListTile(
          leading: Text(todo.id.toString()),
          title: Text(todo.title,style: TextStyle(color: Colors.black,fontSize: 40),),
          subtitle: Column(
            children: [
              Text(todo.userId.toString()),
              Text(todo.body),

            ],
          ),


        );
      }
        );
      },
      ),
    );
  }
}
