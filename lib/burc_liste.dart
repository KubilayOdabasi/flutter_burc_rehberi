import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/utils/strings.dart';
import 'models/burc.dart';

class BurcListesi extends StatelessWidget {
  List<Burc> tumBurclar;

  @override
  Widget build(BuildContext context) {
    tumBurclar = veriKaynaginiHazirla();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Burç Rehberi'),
      ),
      body: listeyiHazirla(),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> burclar = [];

    for (int i = 0; i < 12; i++) {
      String kucukResim = Strings.BURC_ADLARI[i].toLowerCase() + '${i + 1}.png';
      String buyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + '_buyuk${i + 1}.png';

      Burc eklenecekBurc = new Burc(
        Strings.BURC_ADLARI[i],
        Strings.BURC_TARIHLERI[i],
        Strings.BURC_GENEL_OZELLIKLERI[i],
        kucukResim,
        buyukResim,
      );

      burclar.add(eklenecekBurc);
    }

    return burclar;
  }

  Widget listeyiHazirla() {
    return new ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return tekSatirBurc(context, index);
      },
      itemCount: tumBurclar.length,
    );
  }

  Widget tekSatirBurc(BuildContext context, int index) {
    Burc oanListeyeEklenenBurc = tumBurclar[index];

    return new Card(
      elevation: 4,
      child: new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new ListTile(
          onTap: (){
            debugPrint('${oanListeyeEklenenBurc.burcAdi} - Tıklandı');
            Navigator.pushNamed(context, '/burcDetay/$index');
          },
          leading: new Image.asset(
            'images/' + oanListeyeEklenenBurc.burcKucukResim,
            width: 64,
            height: 64,
          ),
          title: new Text(
            oanListeyeEklenenBurc.burcAdi,
            style: new TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Colors.indigo.shade500,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: new Text(
              oanListeyeEklenenBurc.burcTarihi,
              style: new TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black38,
              ),
            ),
          ),
          trailing: new Icon(
            Icons.arrow_forward_ios,
            color: Colors.indigo,
          ),
        ),
      ),
    );
  }
}
