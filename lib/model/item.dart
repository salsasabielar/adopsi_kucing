class Item {
  int _id;
  String _name;
  String _kode;
  String _jenisKelamin;
  String _ras;

  int get id => _id;

  String get name => this._name;
  set name(String value) => this._name = value;

  String get kode => this._kode;
  set kode(String value) => this._kode = value;

  String get jenisKelamin => this._jenisKelamin;
  set jenisKelamin(String value) => this._jenisKelamin = value;

  String get ras => this._ras;
  set ras(String value) => this._ras = value;

  // konstruktor versi 1
  Item(this._kode, this._ras, this._name, this._jenisKelamin);

  // konstruktor versi 2: konversi dari Map ke Item
  // mengambil data dari sql yang tersimpan berbentuk Map, disimpan kembali dalam bentuk variabel
  Item.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._kode = map['kode'];
    this._ras = map['ras'];
    this._name = map['name'];
    this._jenisKelamin = map['jenisKelamin'];
  }

  // konversi dari Item ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['kode'] = kode;
    map['ras'] = ras;
    map['name'] = name;
    map['jenisKelamin'] = jenisKelamin;
    return map;
  }
}
