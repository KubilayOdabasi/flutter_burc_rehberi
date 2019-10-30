import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/burc_liste.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Burç Rehberi',
      theme: new ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: new BurcListesi(),
    );
  }
}
