import 'package:expirations/design_system/colors.dart';
import 'package:flutter/material.dart';

typedef MyBuilder = void Function(
    BuildContext context, void Function(int) methodFromChild);

class SegmentedSelector extends StatefulWidget {
  final List<String> items;
  final MyBuilder builder;
  final ValueChanged<int> onValueChanged;
  final int selectedIndex;

  const SegmentedSelector({
    super.key,
    this.items = const [],
    required this.builder,
    required this.onValueChanged,
    this.selectedIndex = 0,
  });

  @override
  State<SegmentedSelector> createState() => _SegmentedSelectorState();
}

class _SegmentedSelectorState extends State<SegmentedSelector> {
  late int index;
  late int previousIndex;

  @override
  void initState() {
    super.initState();
    index = widget.selectedIndex;
    previousIndex = index;
  }

  void updateIndex(int newIndex) {
    setState(() {
      previousIndex = index;
      index = newIndex;
    });
    Future.delayed(Duration(milliseconds: 150), () {
      setState(() {
        previousIndex = newIndex;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.builder.call(context, updateIndex); // Call the builder here

    final itemWidth = 96/360 * MediaQuery.of(context).size.width;

    return Container(
      height: 42.0,
      decoration: BoxDecoration(
        color: white,
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
            left: index * ((MediaQuery.of(context).size.width - (widget.items.length * itemWidth)) /
                (widget.items.length - 1) + itemWidth - 26),
            height: 26.0,
            child: Container(
              width: itemWidth,
              height: 42.0,
              decoration: BoxDecoration(
                color: Color(0xff0060ff),
                borderRadius: BorderRadius.circular(1000),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: widget.items
                .asMap()
                .entries
                .map(
                  (entry) => TextButton(
                    onPressed: () {
                      updateIndex(entry.key);
                      widget.onValueChanged(entry.key);
                    },
                    style: TextButton.styleFrom(
                      fixedSize: Size.fromWidth(itemWidth),
                      padding:
                          EdgeInsets.symmetric(vertical: 2, horizontal: 16),
                      alignment: Alignment.center,
                    ),
                    child: AnimatedDefaultTextStyle(
                      duration: Duration(milliseconds: 130),
                      style: TextStyle(
                        color: entry.key == previousIndex
                            ? Colors.white
                            : Colors.black,
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                      child: Text(entry.value),
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
