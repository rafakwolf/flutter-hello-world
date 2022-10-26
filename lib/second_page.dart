import 'package:flutter/material.dart';
import 'package:ola_mundo/data/list_item.dart';
import 'package:ola_mundo/navigation_drawer.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key, required this.title, this.item});

  final String title;
  final ListItem? item;

  @override
  State<StatefulWidget> createState() {
    return _SecondPageState();
  }
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    var title = args.toString();
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: const NavigationDrawer(),
        // ignore: prefer_const_constructors
        body: Center(
          child: Text('Selected $title'),
        ));
  }
}
