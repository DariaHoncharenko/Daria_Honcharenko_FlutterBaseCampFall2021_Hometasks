import 'package:campnotes/helpers/mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:todos_app_core/todos_app_core.dart';
import 'package:campnotes/widgets/widgets.dart';

class WorkListTodo extends StatelessWidget {
  WorkListTodo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final todos = mockWork;
    return ListView.builder(
      key: ArchSampleKeys.todoWorkList,
      itemCount: todos.length,
      itemBuilder: (BuildContext context, int index) {
        final todo = todos[index];
        return TodoItem(
          todo: todo,
          onTap: () async {},
          onCheckboxChanged: (_) {},
        );
      },
    );
  }
}