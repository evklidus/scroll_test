import 'package:flutter/material.dart';
import 'package:scroll_test/swipe_tasks/presentation/screens/swipe_tasks_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SwipeTasksScreen(),
    );
  }
}
