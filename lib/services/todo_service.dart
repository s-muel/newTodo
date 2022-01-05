import 'package:http/http.dart';

class TodoService {
  final String baseUrl = "https://sammy-todoapi.herokuapp.com/todo";

  //get all todo
  Future<Response> getAllTodo() async {
    return await get(Uri.parse('$baseUrl/todos'));
  }

  //create todo
  Future<Response> createTodo(
      {required String title,
      required String description,
      required DateTime date}) async {
    Map<String, dynamic> body = {
      "title": title,
      "description": description,
      "date": date
    };
    return await post(Uri.parse('$baseUrl/todos'), body: body);
  }

  //getting one todo
  Future<Response> getTodobyId(String id) async {
    return await get(Uri.parse('$baseUrl/todos/$id'));
  }

  // update todo
  Future<Response> updateStatus(String id) async {
    Map<String, dynamic> body = {
      "isCompleted": true
    };
    return await patch(Uri.parse('$baseUrl/todos/$id'), body: body);
  }
  Future<Response> deleteTodo(String id) async {
    return await delete(Uri.parse('$baseUrl/todos/$id'));
  }
}
