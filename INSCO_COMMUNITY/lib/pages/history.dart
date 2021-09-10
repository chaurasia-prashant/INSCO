import 'package:flutter/material.dart';
import 'package:INSCO_COMMUNITY/constants/color.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
		
          title: Text('History'),
		   backgroundColor: Colour.buttonColor,
        ),
        body: Container(
          child: Center(child: Text('HistoryPage')),
        ),
      ),
    );
  }
}
