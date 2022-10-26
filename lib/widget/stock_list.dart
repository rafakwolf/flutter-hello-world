import 'package:flutter/material.dart';
import 'package:ola_mundo/data/stock.dart';

import 'list_item_widget.dart';

class StockList extends StatelessWidget {
  final List<Stock> items;

  const StockList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      initialItemCount: items.length,
      itemBuilder:
          (BuildContext context, int index, Animation<double> animation) {
        return ListItemWidget(
            item: items[index],
            onClicked: () {
              Navigator.pushNamed(context, "/second", arguments: items[index]);
            });
      },
    );
  }
}
