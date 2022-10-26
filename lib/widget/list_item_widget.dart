import 'package:flutter/material.dart';
import 'package:jovial_svg/jovial_svg.dart';
import 'package:ola_mundo/data/stock.dart';

class ListItemWidget extends StatelessWidget {
  final Stock item;
  final VoidCallback? onClicked;

  const ListItemWidget({super.key, required this.item, this.onClicked});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.blueGrey.shade100),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: ScalableImageWidget.fromSISource(
            si: ScalableImageSource.fromSvgHttpUrl(Uri.parse(item.logourl))),
        title: Text(item.longName,
            style: const TextStyle(fontSize: 20, color: Colors.black)),
        subtitle: Text(item.symbol,
            style: const TextStyle(fontSize: 16, color: Colors.black87)),
        trailing: IconButton(
          icon: const Icon(
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
