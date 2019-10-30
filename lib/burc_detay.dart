import 'package:flutter/material.dart';
import 'burc_liste.dart';
import 'models/burc.dart';

class BurcDetay extends StatelessWidget {
  int burcIndex;
  Burc secilenBurc;

  BurcDetay(this.burcIndex);

  @override
  Widget build(BuildContext context) {
    secilenBurc = BurcListesi.tumBurclar[burcIndex];

    return new Scaffold(
      body: new CustomScrollView(
        primary: false,
        slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            primary: true,
            flexibleSpace: new FlexibleSpaceBar(
              title: new Text(secilenBurc.burcAdi + ' Burcu ve Özellikleri'),
              background: Image.asset(
                'images/' + secilenBurc.burcBuyukResim,
                fit: BoxFit.cover,
              ),
            ),
          ),
          new SliverToBoxAdapter(
            child: new SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8.0),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(
                    new Radius.circular(10),
                  ),
                  color: Colors.indigo.shade50,
                ),
                child: new Text(
                  secilenBurc.burcDetay,
                  style: new TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
