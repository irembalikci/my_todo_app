import 'package:flutter/material.dart';
import 'package:my_todo_app/ui/components/my_app_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "ToDo"),
      body: Center(),
    );
  }
}