import 'package:flutter/material.dart';
import 'package:scroll_test/swipe_tasks/presentation/widgets/custom_list_tile.dart';

class SwipeTaskTwo extends StatefulWidget {
  const SwipeTaskTwo({Key? key}) : super(key: key);

  @override
  State<SwipeTaskTwo> createState() => _SwipeTaskTwoState();
}

class _SwipeTaskTwoState extends State<SwipeTaskTwo> {
  double _offset = 0;
  setOffsetToOtherListTiles(double offset) {
    _offset = offset;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListTile(
          setOffsetToOtherListTiles: setOffsetToOtherListTiles,
          offsetPreset: _offset,
        ),
        CustomListTile(
          setOffsetToOtherListTiles: setOffsetToOtherListTiles,
          offsetPreset: _offset,
        ),
        CustomListTile(
          setOffsetToOtherListTiles: setOffsetToOtherListTiles,
          offsetPreset: _offset,
        ),
        CustomListTile(
          setOffsetToOtherListTiles: setOffsetToOtherListTiles,
          offsetPreset: _offset,
        ),
      ],
    );
  }
}
