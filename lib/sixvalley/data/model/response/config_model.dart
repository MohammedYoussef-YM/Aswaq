class ConfigModel {
  List<CurrencyList> _currencyList;

  ConfigModel({List<CurrencyList> currencyList}) {
    this._currencyList = currencyList;
  }

  // ignore: unnecessary_getters_setters
  List<CurrencyList> get currencyList => _currencyList;

  // ignore: unnecessary_getters_setters
  set currencyList(List<CurrencyList> value) {
    _currencyList = value;
  }

  ConfigModel.fromJson(Map<String, dynamic> json) {
    if (json['currency_list'] != null) {
      _currencyList = [];
      json['currency_list'].forEach((v) { _currencyList.add(new CurrencyList.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._currencyList != null) {
      data['currency_list'] = this._currencyList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CurrencyList {
  int _id;
  String _name;
  String _symbol;
  String _code;
  String _exchangeRate;
  String _status;
  String _createdAt;
  String _updatedAt;

  CurrencyList({int id, String name, String symbol, String code, String exchangeRate, String status, String createdAt, String updatedAt}) {
    this._id = id;
    this._name = name;
    this._symbol = symbol;
    this._code = code;
    this._exchangeRate = exchangeRate;
    this._status = status;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
  }

  int get id => _id;
  String get name => _name;
  String get symbol => _symbol;
  String get code => _code;
  String get exchangeRate => _exchangeRate;
  String get status => _status;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  CurrencyList.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _symbol = json['symbol'];
    _code = json['code'];
    _exchangeRate = json['exchange_rate'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['symbol'] = this._symbol;
    data['code'] = this._code;
    data['exchange_rate'] = this._exchangeRate;
    data['status'] = this._status;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
