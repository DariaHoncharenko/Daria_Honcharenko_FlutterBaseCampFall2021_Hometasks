import 'package:campnotes/data/models/todo.dart';
import 'package:campnotes/screens/add_edit_screen.dart';
import 'package:campnotes/screens/edit_todo_screen.dart';
import 'package:campnotes/widgets/todos_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos_app_core/todos_app_core.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class TodoItem extends StatelessWidget {
  // final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final ValueChanged<bool> onCheckboxChanged;
  final Todo todo;
  String task;

  TodoItem({
    Key key,
    // @required this.onDismissed,
    @required this.onTap,
    @required this.onCheckboxChanged,
    @required this.todo,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) =>
      ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          key: Key(todo.id),
          actions: [
            IconSlideAction(
              color: Colors.green,
              onTap: () => editTodo(context, todo),
              caption: 'Edit',
              icon: Icons.edit,
            )
          ],
          secondaryActions: [
            IconSlideAction(
              color: Colors.red,
              caption: 'Delete',
              onTap: () => deleteTodo(context, todo),
              icon: Icons.delete,
            )
          ],
          child: buildTodo(context),
        ),
      );

  Widget buildTodo(BuildContext context) =>
      GestureDetector(
        key: ArchSampleKeys.todoItem(todo.id),
        child: ListTile(
          onTap: () => editTodo(context, todo),
          leading: Checkbox(
            key: ArchSampleKeys.todoItemCheckbox(todo.id),
            value: todo.complete,
            onChanged: onCheckboxChanged,
          ),
          title: Hero(
            tag: '${todo.id}__heroTag',
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Text(
                todo.task,
                style: Theme
                    .of(context)
                    .textTheme
                    .headline6,
              ),
            ),
          ),
          subtitle: todo.note.isNotEmpty
              ? Text(
            todo.note,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme
                .of(context)
                .textTheme
                .subtitle1,
          )
              : null,
        ),
      );


  void editTodo(BuildContext context, Todo todo) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context)
            => EditTodoScreen(todo: todo),
        ),
      );


  void deleteTodo(BuildContext context, Todo todo) {
      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.removeTodo(todo);
  }
}