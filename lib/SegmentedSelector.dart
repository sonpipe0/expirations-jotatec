import 'package:flutter/material.dart';

class SegmentedSelector extends StatefulWidget {
  final List<String> items;
  final ValueChanged<int> onValueChanged;
  int index;

  SegmentedSelector({
    this.items = const [],
    required this.onValueChanged,
    this.index = 0,
  });

  @override
  SegmentedSelectorState createState() => SegmentedSelectorState();
}

class SegmentedSelectorState extends State<SegmentedSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.0,
      decoration: BoxDecoration(
        color: const Color(0xffefefef),
        boxShadow: [
          BoxShadow(
            color: const Color(0x40000000),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(1000),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: widget.index * 96.0 + (widget.index + 1) * (4 + widget.index),
            height: 26.0,
            child: Container(
              width: 96.0,
              height: 42.0,
              decoration: BoxDecoration(
                color: Color(0xff0060ff),
                borderRadius: BorderRadius.circular(1000),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: widget.items
                .asMap()
                .entries
                .map(
                  (entry) => TextButton(
                onPressed: () {
                  setState(() {
                    widget.index = entry.key;
                  });
                  widget.onValueChanged(entry.key);
                },
                style: TextButton.styleFrom(
                  fixedSize: Size.fromWidth(96),
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 16),
                  alignment: Alignment.center,
                ),
                child: Text(
                  entry.value,
                  style: TextStyle(
                    color: entry.key == widget.index
                        ? Colors.white
                        : Colors.black,
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
                .toList(),
          ),
        ],
      ),
    );
  }
}
