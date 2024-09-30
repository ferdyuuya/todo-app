import 'package:hive_flutter/hive_flutter.dart';

class ToDoAppDB {
  List toDoList = [];
  final _myBox = Hive.box('myBox'); //Reference to the Box

  //Run first if is this the first time opening the app
  void createInitialDatabase() {
    toDoList = [
      ["Check this Mark", false],
      ["Uncheck this Mark", true],
    ];
  }

  //Load Database
  void loadDatabase() {
    toDoList = _myBox.get("TODOLIST");
  }

  //
  void updateDatabase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
