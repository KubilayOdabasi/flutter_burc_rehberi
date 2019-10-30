import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/burc_detay.dart';
import 'package:flutter_burc_rehberi/burc_liste.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Burç Rehberi',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: '/burcListesi',
      routes: {
        '/': (context) => BurcListesi(),
        '/burcListesi': (context) => BurcListesi(),
        //'/burcDetay/123': (context) => BurcDetay(),
      },
    );
  }
}
