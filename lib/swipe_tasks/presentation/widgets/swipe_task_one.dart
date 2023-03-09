import 'package:flutter/material.dart';
import 'package:scroll_test/swipe_tasks/presentation/widgets/custom_list_tile.dart';

class SwipeTaskOne extends StatefulWidget {
  const SwipeTaskOne({Key? key}) : super(key: key);

  @override
  State<SwipeTaskOne> createState() => _SwipeTaskOneState();
}

class _SwipeTaskOneState extends State<SwipeTaskOne> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CustomListTile(),
        CustomListTile(),
        CustomListTile(),
        CustomListTile(),
      ],
    );
  }
}
