import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Quran extends StatefulWidget {
  @override
  _QuranState createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  List<DataItem> dataItems = List.generate(
    500,
    (index) => DataItem(
      id: index + 1,
      name: 'Item ${index + 1}',
    ),
  );

  List<DataItem> _displayedItems = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _loadInitialItems();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadInitialItems() {
    setState(() {
      _displayedItems = dataItems.sublist(0, 50);
    });
  }

  void _loadMoreItems() {
    setState(() {
      int endIndex = _displayedItems.length + 50;
      if (endIndex > dataItems.length) {
        endIndex = dataItems.length;
      }
      _displayedItems
          .addAll(dataItems.sublist(_displayedItems.length, endIndex));
    });
    Fluttertoast.showToast(
      msg: "New data added",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey[600],
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadMoreItems();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _displayedItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(' ${_displayedItems[index].name}'),
            subtitle: Text('This is ${_displayedItems[index].name}'),
            leading: CircleAvatar(
              child: Text('${_displayedItems[index].id}'),
            ),
          );
        },
      ),
    );
  }
}

class DataItem {
  final int id;
  final String name;

  DataItem({
    required this.id,
    required this.name,
  });
}
