import 'dart:convert';

import 'package:bhagavat_gita/Modal/modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class Gitaprovider extends ChangeNotifier {
  List< GitaModal> Gitalist = [];

  Future<void> jsonParsing() async {
    String json = await rootBundle.loadString('assets/JSON/Shlok.json');
    List photo = jsonDecode(json);
    Gitalist = photo.map((e) =>  GitaModal.fromJson(e)).toList();
    notifyListeners();
  }

  Gitaprovider() {
    jsonParsing();
  }
}