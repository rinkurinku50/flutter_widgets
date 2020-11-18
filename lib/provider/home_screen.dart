import 'package:flutter/material.dart';
import 'package:flutter_widget_example/provider/AddItemScreen.dart';
import 'package:flutter_widget_example/provider/ItemAddNotifier.dart';
import 'package:flutter_widget_example/provider/ShopNameNotifier.dart';
import 'package:provider/provider.dart';

class ProviderHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Screen"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return AddItemScreen();
                },
              ));
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: Consumer<ItemAddNotifier>(
                builder: (context, value, child) {
                  if (value.itemList.isEmpty) {
                    return Center(child: CircularProgressIndicator());
                  }
                  //print(value.itemList[1].itemName);
                  //return Container();
                  return ListView.builder(
                      itemCount: value.itemList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            value.itemList[index].itemName,
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                        );
                      });
                },
              ),
            ),
            Consumer<ShopNameNotifier>(
              builder: (context, value, child) {
                return Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Shop name: ${value.shopName}"),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
