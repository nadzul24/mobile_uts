class Item {
  int _id;
  String kode_buah;
  String _name;
  String _jenis;
  int _price;

  int get id => _id;
  String get kode => this.kode_buah;
  set kode(String value) => this.kode_buah = value;
  String get name => this._name;
  set name(String value) => this._name = value;
  String get jenis => this._jenis;
  set jenis(String value) => this._jenis = value;
  get price => this._price;
  set price(value) => this._price = value;

  // konstruktor versi 1
  Item(this.kode_buah, this._name, this._jenis, this._price);

  // konstruktor versi 2: konversi dari Map ke Item
  Item.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this.kode_buah = map['kode'];
    this._name = map['name'];
    this._jenis = map['jenis'];
    this._price = map['price'];
  }

  // konversi dari Item ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['kode'] = this.kode_buah;
    map['name'] = name;
    map['jenis'] = jenis;
    map['price'] = price;
    return map;
  }
}
