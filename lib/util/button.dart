import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  MyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColorLight,  
      child: Text(
        text,
        style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),  
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),  
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),  
    );
  }
}
