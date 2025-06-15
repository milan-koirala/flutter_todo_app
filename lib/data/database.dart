import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  // reference our box
  final _myBox = Hive.box('mybox');

  // run method runs when the app starts first time even opening this app
  void createInitialData() {
    toDoList = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
      ["Learn Flutter", false],
    ];
  }

  // load data from database
  void loadData() {
    toDoList = _myBox.get('TODOLIST') ?? [];
  }

  // update the database
  void updateDataBase() {
    _myBox.put('TODOLIST', toDoList);
  }
}
