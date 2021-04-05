class Expired {
  int _id;
  String _kodebuah;
  String _tglexp;
  int _jmlbusuk;
  int _stock;

  int get id => _id;
  String get kodebuah => this._kodebuah;
  set kodebuah(String value) => this._kodebuah = value;
  String get tglExp => this._tglexp;
  set tglExp(String value) => this._tglexp = value;
  get busuk => this._jmlbusuk;
  set busuk(value) => this._jmlbusuk = value;
  get stock => this._stock;
  set stock(value) => this._stock = value;

  // konstruktor versi 1
  Expired(this._kodebuah, this._tglexp, this._jmlbusuk, this._stock);

  // konstruktor versi 2: konversi dari Map ke Item
  Expired.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._kodebuah = map['kodebuah'];
    this._tglexp = map['tglExp'];
    this._jmlbusuk = map['busuk'];
    this._stock = map['stock'];
  }

  // konversi dari Item ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['kodebuah'] = this._kodebuah;
    map['tglExp'] = _tglexp;
    map['busuk'] = this._jmlbusuk;
    map['stock'] = this._stock;
    return map;
  }
}
