import 'package:flutter/material.dart';
import 'burc_detay.dart';
import 'burc_liste.dart';

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
      },

      onGenerateRoute: (RouteSettings settings){
        List<String> pathElemanlari = settings.name.split('/');
        if(pathElemanlari[1] == 'burcDetay')
        {
          return MaterialPageRoute(builder: (context) => BurcDetay(int.parse(pathElemanlari[2])));
        }
        else
        {
          return MaterialPageRoute(builder: (context) => BurcListesi());
        }
      },
    );
  }
}
