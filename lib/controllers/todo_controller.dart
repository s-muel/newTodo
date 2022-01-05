import 'dart:convert';

import 'package:my_todo_app1/services/todo_service.dart';

class TodoController {
  final TodoService _todoService = TodoService();

  getAllTodos() async {
    return await _todoService.getAllTodo().then((response){  
      int statusCode = response.statusCode;
      Map<String, dynamic> body = jsonDecode(response.body);
      if(statusCode == 200){
        print("api working");
      }else{
        print("error");
      }
    });
  }
}