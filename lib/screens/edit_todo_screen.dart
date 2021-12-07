import 'package:campnotes/data/models/todo.dart';
import 'package:campnotes/widgets/todo_update_widget.dart';
import 'package:campnotes/widgets/todos_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos_app_core/todos_app_core.dart';


class EditTodoScreen extends StatefulWidget {

  final Todo todo;

  EditTodoScreen( {
    Key key, this.todo,
  }) : super(key: key ?? ArchSampleKeys.editTodoScreen);

  @override
  _EditTodoScreenState createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditTodoScreen> {
  final _formKey = GlobalKey<FormState>();

  String task;
  String note;

  @override
  void initState() {
    super.initState();

    task = widget.todo.task;
    note = widget.todo.note;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Editor'),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: TodoUpdateWidget(
            task: task,
            note: note,
            onChangedTitle: (title) => setState(() => this.task = task),
            onChangedDescription: (desctiption) =>
                setState(() => this.note = note),
            onSavedTodo: saveTodo,
          ),
        ),
      ),
    );
  }

    void saveTodo() {
      final isValid = _formKey.currentState.validate();

      if (!isValid) {
        return;
      } else {
        final provider = Provider.of<TodosProvider>(context, listen: false);

        provider.updateTodo(widget.todo, task, note);

        Navigator.of(context).pop();
      }
    }
}