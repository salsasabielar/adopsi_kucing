class Customer {
  int _id;
  String _name;
  String _alamat;
  String _telp;

  int get id => _id;

  String get name => this._name;
  set name(String value) => this._name = value;

  String get alamat => this._alamat;
  set alamat(String value) => this._alamat = value;

  String get telp => this._telp;
  set telp(String value) => this._telp = value;

  // konstruktor versi 1
  Customer(this._name, this._alamat, this._telp);

  // konstruktor versi 2: konversi dari Map ke Item
  // mengambil data dari sql yang tersimpan berbentuk Map, disimpan kembali dalam bentuk variabel
  Customer.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._alamat = map['alamat'];
    this._telp = map['telp'];
  }

  // konversi dari Item ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['name'] = name;
    map['alamat'] = alamat;
    map['telp'] = telp;
    return map;
  }
}
