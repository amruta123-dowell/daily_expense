import 'package:flutter/material.dart';

class SnackbarWidget extends SnackBar {
  const SnackbarWidget({super.key, required super.content});

  Widget build(BuildContext context) {
    return SnackBar(
      content: content,
      duration: const Duration(milliseconds: 500),
    );
  }
}
