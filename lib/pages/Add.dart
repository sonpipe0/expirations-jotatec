import 'package:expirations/components/SegmentedSelector.dart';
import 'package:flutter/material.dart';
import 'package:expirations/components/SearchBar.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() {
    return _AddState();
  }
}

class _AddState extends State<Add> {
  void _onValueChanged(int index) {
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          spacing: 12,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MySearchBar(onUserSelected: (String user) => {}),
            SegmentedSelector(
              items: ['Battery', 'ECG  PAD'],
              builder:
                  (BuildContext context, void Function(int) methodFromChild) {},
              onValueChanged: _onValueChanged,
              ratio: 120,
              correction: 56,
            )
          ],
        ));
  }
}
