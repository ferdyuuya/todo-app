// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool isTaskCompleted;
  Function(bool?)? onChanged;
  
  ToDoTile({
    super.key,
    required this.taskName, 
    required this.isTaskCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Row(
          children: [
            Checkbox(value: isTaskCompleted, onChanged: onChanged),
            SizedBox(width: 10), 
            Flexible( 
              child: Text(
                taskName, //value for text
                overflow: TextOverflow.visible, 
                style: TextStyle(
                  decoration:isTaskCompleted 
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
                  color :  isTaskCompleted
                  ? Colors.grey
                  : Colors.black87,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
