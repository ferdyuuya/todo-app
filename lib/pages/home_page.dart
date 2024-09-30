import 'package:flutter/material.dart';
import 'package:myapp/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow[700],
        title: Text("To-do-List"),
        elevation: 0,
      ),
      body: ListView(
        children: [
          ToDoTile(
            taskName: "Follow Tutorial",
            isTaskCompleted: true,
            onChanged:(p0) {
              
            },
          ),
          ToDoTile(
            taskName: "In my heart of hearts I know that I could never love again I've lost everything, everything Everything that matters to me matters in this world",
            isTaskCompleted: false,
            onChanged:(p0) {
              
            },
          ),
        ],
      ),
    );
  }
}