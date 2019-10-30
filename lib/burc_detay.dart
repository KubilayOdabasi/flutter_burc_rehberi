import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'burc_liste.dart';
import 'models/burc.dart';

class BurcDetay extends StatefulWidget {
  int burcIndex;

  BurcDetay(this.burcIndex);

  @override
  _BurcDetayState createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Burc secilenBurc;
  Color appBarRenk;

  PaletteGenerator paletteGenerator;
  void appBarRenkAyarla (){
    Future<PaletteGenerator> appBarResmi = PaletteGenerator.fromImageProvider(AssetImage('images/' + secilenBurc.burcBuyukResim));
    appBarResmi.then((value) {
      paletteGenerator = value;
      setState(() {
        appBarRenk = paletteGenerator.dominantColor.color;
      });
    });

  }

  @override
  void initState() {
    super.initState();
    secilenBurc = BurcListesi.tumBurclar[widget.burcIndex];
    appBarRenkAyarla();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new CustomScrollView(
        primary: false,
        slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            primary: true,
            backgroundColor: appBarRenk != null ? appBarRenk : Colors.indigo,
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
