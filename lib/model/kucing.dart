class Kucing {
  int _id;
  String _name;
  String _kode;
  int _stok;

  int get id => _id;

  String get name => this._name;
  set name(String value) => this._name = value;

  String get kode => this._kode;
  set kode(String value) => this._kode = value;

  get stok => this._stok;
  set stok(value) => this._stok = value;

  // konstruktor versi 1
  Kucing(this._name, this._kode, this._stok);

  // konstruktor versi 2: konversi dari Map ke Item
  // mengambil data dari sql yang tersimpan berbentuk Map, disimpan kembali dalam bentuk variabel
  Kucing.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._kode = map['kode'];
    this._stok = map['stok'];
  }

  // konversi dari Item ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['name'] = name;
    map['kode'] = kode;
    map['stok'] = stok;
    return map;
  }
}
