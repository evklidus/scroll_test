import 'package:flutter/material.dart';
import 'package:scroll_test/swipe_tasks/presentation/widgets/swipe_task_one.dart';
import 'package:scroll_test/swipe_tasks/presentation/widgets/swipe_task_two.dart';

class SwipeTasksScreen extends StatefulWidget {
  const SwipeTasksScreen({super.key});

  @override
  State<SwipeTasksScreen> createState() => _SwipeTasksScreenState();
}

class _SwipeTasksScreenState extends State<SwipeTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Task 1'),
            SwipeTaskOne(),
            Text('Task 2'),
            SwipeTaskTwo(),
          ],
        ),
      ),
    );
  }
}
