import 'package:todolist_bloc/model/todo.dart';

class Todos {
  late List<Todo> todos;

  Todos({required this.todos});

  Todos.fromJson(List<dynamic> json) {
    todos = List<Todo>.empty(growable: true);
    for (dynamic val in json) {
      todos.add(Todo.fromJson(val));
    }
  }
}
