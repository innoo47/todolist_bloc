import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:todolist_bloc/model/todos.dart';

class TodosApiProvider {
  /// Provider (Data Provider)
  ///
  /// 데이터 제공 및 수집, 데이터 처리

  Client client = Client();

  Future<Todos> fetchTodosList() async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      return Todos.fromJson(data);
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
