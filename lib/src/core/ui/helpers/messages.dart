import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin Messages<T extends ConsumerStatefulWidget> on ConsumerState<T> {

    void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color,
    ));
  }

  void showErrorSnackBar(String message) => _showSnackBar(message, Colors.red);

  void showSuccessSnackBar(String message) => _showSnackBar(message, Colors.green);

  void showInfoSnackBar(String message) => _showSnackBar(message, Colors.lightBlue);
}