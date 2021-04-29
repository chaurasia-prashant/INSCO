import 'package:INSCO_COMMUNITY/pages/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(InscoApp());
}

class InscoApp extends StatefulWidget {
  @override
  _InscoAppState createState() => _InscoAppState();
}

class _InscoAppState extends State<InscoApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
