import 'package:flutter/material.dart';
import 'package:flutter_widget_example/provider/ItemAddNotifier.dart';
import 'package:flutter_widget_example/provider/ShopNameNotifier.dart';
import 'package:provider/provider.dart';

class AddItemScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddItemScreen'),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15.0), hintText: 'Item Name'),
            ),
            SizedBox(height: 20.0),
            RaisedButton(
                child: Text('AddItem'),
                onPressed: () async {
                  if (_controller.text.isEmpty) {
                    return;
                  }
                  await Provider.of<ItemAddNotifier>(context, listen: false)
                      .addItem(_controller.text);

                  Navigator.pop(context);
                }),
            SizedBox(height: 10.0),
            Divider(height: 4, thickness: 1),
            SizedBox(height: 10.0),
            TextField(
                controller: _controller2,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(15.0),
                    hintText: 'Shop Name')),
            SizedBox(height: 20.0),
            RaisedButton(
                child: Text('Add Shop'),
                onPressed: () {
                  if (_controller2.text.isEmpty) {
                    return;
                  }
                  Provider.of<ShopNameNotifier>(context, listen: false)
                      .addShopName(_controller2.text);
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
