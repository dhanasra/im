import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:im/app/app.dart';

class PartyViewModel{
  static late PartyViewModel _instance;

  factory PartyViewModel(App app) {
    _instance = PartyViewModel._internal();
    return _instance;
  }

  PartyViewModel._internal() {
    _init();
  }

  TextEditingController partyNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  StreamController splashLoad = StreamController<String>.broadcast();

  void _init() {

  }

}