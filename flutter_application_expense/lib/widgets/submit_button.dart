import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String? text;
  final VoidCallback onClickButton;
  const SubmitButton({super.key, this.text, required this.onClickButton});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
      ),
      onPressed: onClickButton,
      child: const Text(
        "Submit",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
