import 'package:flutter/material.dart';

class ListMapProvider extends ChangeNotifier {
  List<Map<String, dynamic>> mData = [];

  List<Map<String, dynamic>> getData() => mData;

  void addData(Map<String, dynamic> data) {
    mData.add(data);
    notifyListeners();
  }
}
