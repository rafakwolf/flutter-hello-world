// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ola_mundo/api/brapi.dart';
import 'package:ola_mundo/data/stock.dart';
import 'package:ola_mundo/data/stocks_test.dart';
import 'package:ola_mundo/widget/list_item_widget.dart';
import 'navigation_drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String stockTickers = List.from(stocksList).join(",");

  Future<List> getStocks() async {
    var strStocks = await getStocksData(stockTickers);
    var stocks = jsonDecode(strStocks);

    return stocks['results'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      drawer: const NavigationDrawer(),
      body: FutureBuilder<List>(
          future: getStocks(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              // print(snapshot.error);
              return Center(
                child: Text("Erro ao carregar as ações"),
              );
            }

            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var currentItem = snapshot.data![index];
                  return ListItemWidget(
                      item: Stock(
                          currentItem['symbol'],
                          currentItem['shortName'],
                          currentItem['longName'],
                          currentItem['regularMarketPrice'] == null
                              ? 0.0
                              : currentItem['regularMarketPrice'].toDouble(),
                          currentItem['logourl']),
                      onClicked: () {
                        Navigator.pushNamed(context, "/second",
                            arguments: currentItem);
                      });
                },
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
