import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  ErrorPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Error Page'),
    );
  }
}
