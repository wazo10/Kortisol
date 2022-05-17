import 'package:flutter/material.dart';
import 'package:todo_list/todo.dart';
class NewTodoDialog extends StatelessWidget {
  final controller = TextEditingController();
  NewTodoDialog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('New todo'),
      content: TextField(
        controller: controller,
        autofocus: true,
      ),
      actions: <Widget>[
        FlatButton(
          child: const Text('Cancel'),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: const Text('Add'),
          onPressed: () {
            final todo = Todo(title: controller.value.text);
            controller.clear();
            Navigator.of(context).pop(todo);
          }
        ),
      ]
    );
  }
}