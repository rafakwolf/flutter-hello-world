// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ola_mundo/data/list_item.dart';

class ListItemWidget extends StatelessWidget {
  final ListItem item;
  final Animation<double> animation;
  final VoidCallback? onClicked;

  const ListItemWidget(
      {super.key, required this.item, required this.animation, this.onClicked});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.blueGrey.shade100),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: CircleAvatar(
          radius: 38,
          backgroundImage: NetworkImage(item.imageUrl),
        ),
        title: Text(item.title,
            style: TextStyle(fontSize: 20, color: Colors.black)),
        subtitle: Text(item.subTitle,
            style: TextStyle(fontSize: 16, color: Colors.black87)),
        trailing: IconButton(
          icon: Icon(
            Icons.chevron_right,
            color: Colors.black,
            size: 32,
          ),
          onPressed: onClicked,
        ),
      ),
    );
  }
}
