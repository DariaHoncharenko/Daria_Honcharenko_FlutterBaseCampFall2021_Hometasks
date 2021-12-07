import 'package:campnotes/data/models/todo.dart';
import 'package:flutter/cupertino.dart';


class TodosProvider extends ChangeNotifier {

  List<Todo> _todos = [
    Todo('Custom Task 1', id: '1',),
    Todo('Custom Task 2', id: '2',),
    Todo('Custom Task 3', id: '3',),
    Todo('Custom Task 4', id: '4',),
  ];

  List<Todo> get todos =>
      _todos.where((todo) => todo.complete == false).toList();


  void removeTodo(Todo todo) {
    _todos.remove(todo);

    notifyListeners();
  }

  void updateTodo(Todo todo, String task, String note) {
    todo.task = task;
    todo.note = note;

    notifyListeners();
  }

}