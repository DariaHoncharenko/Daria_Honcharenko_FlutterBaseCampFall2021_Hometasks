import 'package:flutter/material.dart';

class TodoUpdateWidget extends StatelessWidget {
  final String task;
  final String note;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;

  const TodoUpdateWidget({
    Key key,
    this.task,
    this.note,
    @required this.onChangedTitle,
    @required this.onChangedDescription,
    @required this.onSavedTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildTitle(),
        SizedBox(height: 7),
        buildDescription(),
        SizedBox(height: 16),
        buildButton(),
      ],
    ),
  );

  Widget buildTitle() => TextFormField(
    maxLines: 1,
    initialValue: task,
    onChanged: onChangedTitle,
    validator: (title) {
      if (title.isEmpty) {
        return 'The title cannot be empty';
      }
      return null;
    },
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Task',
    ),
  );

  Widget buildDescription() => TextFormField(
    maxLines: 5,
    initialValue: note,
    onChanged: onChangedDescription,
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Additional notes',
    ),
  );

  Widget buildButton() => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black),
      ),
      onPressed: onSavedTodo,
      child: Text('Save'),
    ),
  );
}