import 'package:flutter/material.dart';

import 'components/SegmentedSelector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'Expiring'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  void _onValueChanged(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 93,
        backgroundColor: Theme.of(context).colorScheme.surfaceBright,
        title: Padding(
          padding: EdgeInsets.only(top: 42),
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w600,
              fontFamily: 'Roboto',
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox.fromSize(size: Size.fromHeight(20)),
            SegmentedSelector(
              items: ['Today', 'Month', 'Custom'],
              onValueChanged: _onValueChanged,
            ),
          ],
        ),
      ),
    );
  }
}
