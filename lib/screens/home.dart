import 'package:flutter/material.dart';
import '../model/todo.dart';
import '../constants/colors.dart';
import '../widgets/todo_item.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<ToDo> todosList = ToDo.todoList();

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _handleDeleteItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addNewTask() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newTaskText = '';
        return AlertDialog(
          title: Text('Add New Task'),
          content: TextField(
            autofocus: true,
            decoration: InputDecoration(hintText: 'Enter task here'),
            onChanged: (text) {
              newTaskText = text;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (newTaskText.isNotEmpty) {
                  setState(() {
                    todosList.add(ToDo(
                      id: DateTime.now().toString(),
                      todoText: newTaskText,
                    ));
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('ToDo App'),
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 16),
        itemCount: todosList.length,
        itemBuilder: (context, index) {
          return ToDoItem(
            todo: todosList[index],
            onToDoChanged: _handleToDoChange,
            onDeleteItem: _handleDeleteItem,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewTask,
        backgroundColor: secondaryColor,
        child: Icon(Icons.add),
      ),
    );
  }
}
