class Expired {
  int _id;
  String tgl_exp;
  int jml_busuk;
  int _stock;

  int get id => _id;
  String get tglExp => this.tgl_exp;
  set tglExp(String value) => this.tgl_exp = value;
  get busuk => this.jml_busuk;
  set busuk(value) => this.jml_busuk = value;
  get stock => this._stock;
  set stock(value) => this._stock = value;

  // konstruktor versi 1
  Expired(this.tgl_exp, this.jml_busuk, this._stock);

  // konstruktor versi 2: konversi dari Map ke Item
  Expired.fromMapExp(Map<String, dynamic> map) {
    this._id = map['id'];
    this.tgl_exp = map['tgl expired'];
    this.jml_busuk = map['jumlah busuk'];
    this._stock = map['stock'];
  }

  // konversi dari Item ke Map
  Map<String, dynamic> toMapExp() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['tanggal expired'] = tgl_exp;
    map['jumlah busuk'] = this.jml_busuk;
    map['stock'] = this._stock;
    return map;
  }
}
