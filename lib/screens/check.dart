// import 'package:flutter/material.dart';

// class Quran extends StatefulWidget {
//   @override
//   _QuranState createState() => _QuranState();
// }

// class _QuranState extends State<Quran> {
//   List<String> _items = [];
//   int _currentPage = 0;
//   int _pageSize = 10;

//   @override
//   void initState() {
//     super.initState();
//     _loadData();
//   }

//   Future<void> _loadData() async {
//     // Simulate a delay in loading data
//     await Future.delayed(Duration(seconds: 2));

//     setState(() {
//       // Generate 10 new items for each page
//       _items.addAll(List.generate(
//           10, (index) => 'Item ${_currentPage * _pageSize + index}'));
//       _currentPage++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: ListView.builder(
//         itemCount: _items.length + 1,
//         itemBuilder: (BuildContext context, int index) {
//           if (index == _items.length) {
//             return _buildProgressIndicator();
//           } else {
//             return ListTile(
//               title: Text(_items[index]),
//             );
//           }
//         },
//         onScrollEndDrag: (details) {
//           // If we're at the end of the list, load more data
//           if (details.metrics.pixels == details.metrics.maxScrollExtent) {
//             _loadData();
//           }
//         },
//       ),
//     );
//   }

//   Widget _buildProgressIndicator() {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 16.0),
//       child: Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
// }
