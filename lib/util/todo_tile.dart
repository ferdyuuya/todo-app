// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool isTaskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.isTaskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(), // Added `const` for optimization
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(13),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20), // Added `const` for optimization
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(13),
          ),
          child: Row(
            children: [
              Checkbox(
                value: isTaskCompleted,
                onChanged: onChanged,
              ),
              Flexible(
                child: Text(
                  taskName,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    decoration: isTaskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    color: isTaskCompleted ? Colors.grey : Colors.black87,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
