import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({Key? key, this.message = ""}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Text(message);
  }
}
