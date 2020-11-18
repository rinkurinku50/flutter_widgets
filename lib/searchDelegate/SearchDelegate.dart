import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_widget_example/searchDelegate/DelegateModel.dart';

class SearchDelegateUI extends StatefulWidget {
  @override
  _SearchDelegateUIState createState() => _SearchDelegateUIState();
}

class _SearchDelegateUIState extends State<SearchDelegateUI> {
  List<DelegateModel> _modelData = <DelegateModel>[
    DelegateModel("Hakka Noodles", "Chinese"),
    DelegateModel("Samos", "Indian"),
    DelegateModel("Oreo Shake", "MilkeShake"),
    DelegateModel("Spring Roll", "Chinese"),
    DelegateModel("Chocolate Shake", "MilkShake"),
    DelegateModel("Dum Aloo", "Indian"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Delegate'),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              showSearch(context: context, delegate: FootItemSearch());
            },
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: _modelData.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_modelData[index].title),
              subtitle: Text(_modelData[index].category),
            );
          },
        ),
      ),
    );
  }
}

class FootItemSearch extends SearchDelegate<DelegateModel> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {})];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
