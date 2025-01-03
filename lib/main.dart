import 'package:flutter/material.dart';
import 'package:todolist_bloc/view/todos_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'TodoList Bloc',
      home: TodosView(),
    );
  }
}
