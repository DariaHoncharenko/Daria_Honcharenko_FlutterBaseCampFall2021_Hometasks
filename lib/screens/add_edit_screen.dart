import 'package:campnotes/data/models/todo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todos_app_core/todos_app_core.dart';

import '../localization.dart';

typedef OnSaveCallback = Function(String task, String note);

class AddEditScreen extends StatefulWidget {
  // final bool isEditing;
  // final OnSaveCallback onSave;
  final Todo todo;

  AddEditScreen({
    Key key,
    // @required this.onSave, -- at the moment they aren't used to solve the current task;
    // @required this.isEditing,
    this.todo,
  }) : super(key: key ?? ArchSampleKeys.addTodoScreen);

  @override
  _AddEditScreenState createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  String _task;
  String _note;

  // bool get isEditing => widget.isEditing;

@override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text(FlutterBlocLocalizations.of(context).appSecondTitle),
      ),
      body:
      Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                style: Theme.of(context).textTheme.headline5,
                decoration: InputDecoration(
                  hintText: ' What needs to be done?',
                ),
                onChanged: (String value) {
                  _task = value;},
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 450),
              child: TextField(
                style: Theme.of(context).textTheme.subtitle1,
                decoration: InputDecoration(
                  labelText: ' Additional notes...',
                ),
                maxLines: 10,
                minLines: 7,
                onChanged: (String value) {
                  _note = value;
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('New task:' + _task);
          print('Description of the task:' + _note);
        },
        child: Icon(Icons.add),
        tooltip: ArchSampleLocalizations.of(context).addTodo,
      )
  );
 }
}