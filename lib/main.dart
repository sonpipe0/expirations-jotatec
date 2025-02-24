import 'package:expirations/components/FeedCard.dart';
import 'package:expirations/hooks/mockUseFeed.dart';
import 'package:expirations/types/FeedCardInfo.dart';
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

  final List<FeedCardInfo> feedCards = List.from(MockUseFeed().getFeed()..sort((a, b) => a.date.compareTo(b.date)));

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
            SizedBox.fromSize(size: Size.fromHeight(16)),
            Column(
              mainAxisSize: MainAxisSize.max,
              spacing: 12.0,
              children: [
                ...feedCards.asMap().entries.map((entry) {
                  int index = entry.key;
                  FeedCardInfo info = entry.value;
                  return FeedCard(key: ValueKey(index), information: info);
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}
