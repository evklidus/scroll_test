import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  const CustomListTile(
      {Key? key, this.setOffsetToOtherListTiles, this.offsetPreset})
      : super(key: key);
  final Function(double offset)? setOffsetToOtherListTiles;
  final double? offsetPreset;

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  late double _dragStart;
  late double _offset;

  @override
  void initState() {
    super.initState();
    _offset = widget.offsetPreset ?? 0;
  }

  @override
  void didUpdateWidget(covariant CustomListTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    _offset = widget.offsetPreset ?? 0;
  }

  void _onHorizontalDragStart(DragStartDetails details) {
    _dragStart = details.globalPosition.dx;
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    double newPosition = details.globalPosition.dx - _dragStart;
    // Не даёт выйти за границы экрана
    if (newPosition < -70) {
      newPosition = -70;
    } else if (newPosition > 70) {
      newPosition = 70;
    }
    setState(() {
      _offset = newPosition;
      _setOffsetToOtherListTiles();
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    // Устанавливает виджет слева или справа,
    // если пользователь провел достаточную длину пальцем
    if (_offset < -60) {
      setState(() {
        _offset = -70;
        _dragStart = -70;
        _setOffsetToOtherListTiles();
      });
    } else if (_offset > 60) {
      setState(() {
        _offset = 70;
        _dragStart = 70;
        _setOffsetToOtherListTiles();
      });
    } else {
      setState(() {
        _offset = 0;
        _setOffsetToOtherListTiles();
      });
    }
  }

  _setOffsetToOtherListTiles() {
    if (widget.setOffsetToOtherListTiles != null) {
      widget.setOffsetToOtherListTiles!(_offset);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _onHorizontalDragStart,
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      onHorizontalDragEnd: _onHorizontalDragEnd,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        transform: Matrix4.translationValues(_offset, 0, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.lightGreenAccent,
          ),
        ),
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(20),
        child: const Text('Поскроль меня вправо или влево'),
      ),
    );
  }
}
