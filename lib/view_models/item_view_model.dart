import 'package:im/app/app.dart';

class ItemViewModel{
  static late ItemViewModel _instance;

  factory ItemViewModel(App app) {
    _instance = ItemViewModel._internal();
    return _instance;
  }

  ItemViewModel._internal() {
    _init();
  }

  var selectedUnit = "";

  Map<String,String> units= {
    "NONE": "NONE",
    "COPY": "COPY",
    "PETI": "PET",
    "JARS": "JAR",
    "FEET": "FT",
    "INCHES": "IN",
    "CASE": "CASE",
    "PAD": "PAD",
    "TABLETS": "TBS",
    "TONNES": "TON",
    "UNITS": "UNT",
    "YARDS": "YDS",
    "HOURS": "HRS",
    "LITRE": "LTR",
    "MILLIGRAM": "MLG",
    "BOX": "BOX",
    "CAN": "CAN",
    "CENTIMETER": "CM",
    "KILOGRAMS": "KGS",
    "KILOMETRE": "KME",
    "ACRE": "AC",
  };

  void _init() {

  }

}