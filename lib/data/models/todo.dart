import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Todo extends Equatable {
  bool complete;
  String id;
  String note;
  String task;

  Todo(
    this.task, {
    this.complete = false,
    String note = '',
    String id,
  })  : this.note = note ?? '',
        this.id = id;

  Todo copyWith({bool complete, String id, String note, String task}) {
    return Todo(
      task ?? this.task,
      complete: complete ?? this.complete,
      id: id ?? this.id,
      note: note ?? this.note,
    );
  }

  @override
  List<Object> get props => [complete, id, note, task];

  @override
  String toString() {
    return 'Todo { complete: $complete, task: $task, note: $note, id: $id }';
  }
}
