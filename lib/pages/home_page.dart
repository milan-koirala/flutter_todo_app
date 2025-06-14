import 'package:flutter/material.dart';
import 'package:my_simple_app/util/dialog_box.dart';
import 'package:my_simple_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // text controller
  final _controller = TextEditingController();

  // list of todo tasks
  List todoTasks = [
    ["Make Tutorial", false],
    ["Do Exercise", false],
    ["Read Book", false],
    ["Watch Movie", false],
    ["Clean Room", false],
    ["Plan Vacation", false],
    ["Learn Flutter", false],
  ];

  // checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoTasks[index][1] = !todoTasks[index][1];
    });
  }

  // save new task
  void saveNewTask() {
    setState(() {
      todoTasks.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  // create new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(title: const Text('TO DO'), elevation: 0),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: todoTasks.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: todoTasks[index][0],
            taskCompleted: todoTasks[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      ),
    );
  }
}
