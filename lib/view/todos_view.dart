import 'package:flutter/material.dart';
import 'package:todolist_bloc/bloc/todos_bloc.dart';
import 'package:todolist_bloc/model/todos.dart';

class TodosView extends StatefulWidget {
  const TodosView({super.key});

  @override
  State<TodosView> createState() => _TodosViewState();
}

class _TodosViewState extends State<TodosView> {
  final TodosBloc _todosBloc = TodosBloc();

  @override
  void initState() {
    _todosBloc.fetchAllTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(title: const Text('Todo List Bloc')),
        body: StreamBuilder(
          stream: _todosBloc.allTodos,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Todos? todosList = snapshot.data;
              return ListView.builder(
                itemCount: todosList?.todos.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(todosList!.todos[index].id.toString()),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                todosList.todos[index].title!,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                  "userId : ${todosList.todos[index].userId.toString()}"),
                            ],
                          ),
                        ),
                        Checkbox(
                          value: todosList.todos[index].completed == true
                              ? true
                              : false,
                          onChanged: null,
                        ),
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
