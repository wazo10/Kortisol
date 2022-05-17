import 'package:flutter/material.dart';
import 'package:todo_list/todo.dart';
import 'package:todo_list/new_todo_dialog.dart';
typedef ToggleTodoCallback = void Function(Todo, bool);
class TodoList extends StatelessWidget {
  const TodoList({Key? key, required this.todos, required this.onTodoToggle}) : super(key: key);

  final List<Todo> todos;

  final ToggleTodoCallback onTodoToggle;
  _toggleTodo(Todo todo, bool isChecked) {
    setState(() {
      todo.isDone = isChecked;
    });
  }
  Widget _buildItem(BuildContext context, int index) {
    final todo = todos[index];
    return CheckboxListTile(
      value: todo.isDone,
      title: Text(todo.title), onChanged: (bool? isChecked) { onTodoToggle(todo, isChecked!); },
      // onChanged: (bool isChecked) {
      //   onTodoToggle(todo, isChecked);
      // },
    );
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildItem,
      itemCount: todos.length,
    );
  }
  void setState(Null Function() param0) {}
}
class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}
class _TodoListScreenState extends State<TodoListScreen> {
  List<Todo> todos = [];

  _addTodo() async {
  }

  _buildItem() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: ListView.builder(
        itemBuilder: _buildItem,
        itemCount: todos.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: _addTodo,
      ),
    );
  }

}