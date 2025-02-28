import 'package:expirations/components/NavIcon.dart';
import 'package:flutter/material.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key, required this.onValueChanged, this.selectedIndex = 0});

  final ValueChanged<int> onValueChanged;
  final int selectedIndex;

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  late int index;

  @override
  void initState() {
    super.initState();
    index = widget.selectedIndex;
  }

  void updateIndex(int newIndex) {
    setState(() {
      index = newIndex;
    });
    widget.onValueChanged(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewPadding.bottom),
      height: 90.0,
      padding: EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 4,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            style: ButtonStyle(
              padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
              overlayColor: WidgetStateProperty.all<Color>(Colors.transparent),
            ),
            onPressed: () => updateIndex(0),
            child: NavIcon(trailingText: 'expiring', iconName: 'expiring', selected: index == 0),
          ),
          TextButton(
            style: ButtonStyle(
              padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
              overlayColor: WidgetStateProperty.all<Color>(Colors.transparent),
            ),
            onPressed: () => updateIndex(1),
            child: NavIcon(trailingText: 'add', iconName: 'add', selected: index == 1),
          ),
          TextButton(
            style: ButtonStyle(
              padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
              overlayColor: WidgetStateProperty.all<Color>(Colors.transparent),
            ),
            onPressed: () => updateIndex(2),
            child: NavIcon(trailingText: 'search', iconName: 'search', selected: index == 2),
          ),
        ],
      ),
    );
  }
}