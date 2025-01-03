import 'package:todolist_bloc/data_provider/api_provider.dart';
import 'package:todolist_bloc/model/todos.dart';

class TodosRepository {
  final TodosApiProvider _todosApiProvider = TodosApiProvider();

  Future<Todos> fetchAllTodos() async => _todosApiProvider.fetchTodosList();
}
