import 'package:campnotes/widgets/todos_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todos_app_core/todos_app_core.dart';
import 'package:campnotes/widgets/widgets.dart';

    class LeisureListTodo extends StatelessWidget {

      @override
      Widget build(BuildContext context) {

        final provider = Provider.of<TodosProvider>(context);
        final todos = provider.todos;
        return ListView.builder(
          key: ArchSampleKeys.todoLeisureList,
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            final todo = todos[index];
            return TodoItem(
              todo: todo,
              onTap: () {},
              onCheckboxChanged: (_) {},
            );
          },
        );
      }
    }
