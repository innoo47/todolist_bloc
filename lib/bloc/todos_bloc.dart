import 'package:rxdart/subjects.dart';
import 'package:todolist_bloc/model/todos.dart';
import 'package:todolist_bloc/repository/todos_repository.dart';

class TodosBloc {
  final TodosRepository _todosRepository = TodosRepository();
  final PublishSubject<Todos> _todosFetcher = PublishSubject<Todos>();

  Stream<Todos> get allTodos => _todosFetcher.stream;

  Future<void> fetchAllTodos() async {
    Todos todos = await _todosRepository.fetchAllTodos();
    _todosFetcher.sink.add(todos);
  }

  dispose() {
    _todosFetcher.close();
  }
}
