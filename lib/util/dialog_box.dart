import 'package:flutter/material.dart';
import 'package:myapp/util/button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), 
      ),
      backgroundColor: Color.fromARGB(255, 255, 242, 122), 
      title: const Text(
        "Add New Task",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color(0xFF333333), 
        ),
      ),
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Enter task title...",
                hintStyle: TextStyle(color: Colors.grey[600]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ), 
              ),
            ),
            // Save and Cancel buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  text: "Save",
                  onPressed: onSave,
                ),
                const SizedBox(width: 10), 
                MyButton(
                  text: "Cancel",
                  onPressed: onCancel,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
