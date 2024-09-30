// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/data/database.dart';
import 'package:myapp/util/dialog_box.dart';
import 'package:myapp/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Reference to Hive Box
  final _myBox = Hive.box('myBox');
  ToDoAppDB db = ToDoAppDB();

  //Text Controller
  @override
  void initState() {
    //If this the 1st time open the app, create default data else load data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialDatabase();
    } else {
      db.loadDatabase();
    }

    super.initState();
  }

  final _controller = TextEditingController();

  //List of To-do-List

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow[700],
        title: Text("To-do-List"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            isTaskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
