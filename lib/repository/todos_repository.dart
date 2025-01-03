import 'package:todolist_bloc/data_provider/api_provider.dart';
import 'package:todolist_bloc/model/todos.dart';

class TodosRepository {
  /// Repository (Data handler)
  ///
  /// Data Provider로부터 데이터를 받아
  /// 필터링 등 변형하여 BLOC에게 전달

  final TodosApiProvider _todosApiProvider = TodosApiProvider();

  Future<Todos> fetchAllTodos() async => _todosApiProvider.fetchTodosList();
}
