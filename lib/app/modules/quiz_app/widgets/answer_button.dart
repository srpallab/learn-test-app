import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const AnswerButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Text(title, textAlign: TextAlign.center),
    );
  }
}
