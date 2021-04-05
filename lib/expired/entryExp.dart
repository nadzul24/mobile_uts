import 'package:flutter/material.dart';
import 'package:tokobuahh/expired/expired.dart';

class EntryExp extends StatefulWidget {
  final Expired expired;
  EntryExp(this.expired);

  @override
  EntryExpState createState() => EntryExpState(this.expired);
}

//class controller
class EntryExpState extends State<EntryExp> {
  Expired expired;
  EntryExpState(this.expired);
  TextEditingController kodebuahController = TextEditingController();
  TextEditingController tglController = TextEditingController();
  TextEditingController busukController = TextEditingController();
  TextEditingController stockController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //kondisi
    if (expired != null) {
      kodebuahController.text = expired.kodebuah;
      tglController.text = expired.tglExp;
      busukController.text = expired.busuk.toString();
      stockController.text = expired.stock.toString();
    }
    //rubah
    return Scaffold(
        appBar: AppBar(
          title: expired == null ? Text('Tambah') : Text('Ubah'),
          backgroundColor: Colors.yellow[600],
          leading: new IconButton(
            icon: new Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              Navigator.pop(context, expired);
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              // kode buah
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: kodebuahController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Kode Buah',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              // tgl exp
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: tglController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Tanggal Expired Buah',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              // jumlah busuk
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: busukController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Jumlah Buah Busuk',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              // Stock
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: stockController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Stock',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              // tombol button
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    // tombol simpan
                    Expanded(
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          if (expired == null) {
                            // tambah data
                            expired = Expired(
                              kodebuahController.text,
                              tglController.text,
                              int.parse(busukController.text),
                              int.parse(stockController.text),
                            );
                          } else {
                            // ubah data
                            expired.kodebuah = kodebuahController.text;
                            expired.tglExp = tglController.text;
                            expired.busuk = int.parse(busukController.text);
                            expired.stock = int.parse(stockController.text);
                          }
                          // kembali ke layar sebelumnya dengan membawa objek item
                          Navigator.pop(context, expired);
                        },
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    // tombol batal
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Cancel',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
