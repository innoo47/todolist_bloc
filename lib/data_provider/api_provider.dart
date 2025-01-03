import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:todolist_bloc/model/todos.dart';

class TodosApiProvider {
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
