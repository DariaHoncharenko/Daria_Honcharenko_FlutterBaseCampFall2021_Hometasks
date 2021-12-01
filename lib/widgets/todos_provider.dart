import 'package:campnotes/data/models/todo.dart';
import 'package:flutter/cupertino.dart';


class TodosProvider extends ChangeNotifier {

  List<Todo> mockLeisure  = [
    Todo('Custom Task 1', id: '1',),
    Todo('Custom Task 2', id: '2',),
    Todo('Custom Task 3', id: '3',),
    Todo('Custom Task 4', id: '4',),
  ];

  List<Todo> get todos =>
      mockLeisure.where((todo) => todo.complete == false).toList();


  void removeTodo(Todo todo) {
    mockLeisure.remove(todo);

    notifyListeners();
  }

}