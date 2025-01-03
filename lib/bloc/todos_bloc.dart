import 'package:rxdart/subjects.dart';
import 'package:todolist_bloc/model/todos.dart';
import 'package:todolist_bloc/repository/todos_repository.dart';

class TodosBloc {
  ///  BLOC (Presenter, ViewModel)
  ///
  ///  Business Logic을 담은 패키지로,
  ///  화면에 적용시킬 수 있도록 stream을 통해
  ///  add하여 화면에 반영 할 수 있도록 함

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
