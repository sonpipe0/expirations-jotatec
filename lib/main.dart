import 'package:expirations/pages/Feed.dart';
import 'package:expirations/types/UserInfo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/NavigationBar.dart';
import 'components/TopBar.dart';

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

Widget _getPage(int index) {
  switch (index) {
    case 0:
      return Feed();
    case 1:
      return Center(
        child: Text('Add'),
      );
    case 2:
      return Center(child: Text('Search'));
    default:
      throw ArgumentError('Unexpected index: $index');
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int navIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Provider<UserInfo?>(
      create: (context) =>
          UserInfo(username: 'Sonpipe0', email: 'pipefc2003@gmail.com'),
      dispose: (context, value) => value?.dispose(),
      child: Scaffold(
        appBar: TopBar(),
        bottomNavigationBar: MyNavigationBar(
          onValueChanged: (int newIndex) {
            setState(() {
              navIndex = newIndex;
            });
          },
          selectedIndex: navIndex,
        ),
        body: _getPage(navIndex),
      ),
    );
  }
}
