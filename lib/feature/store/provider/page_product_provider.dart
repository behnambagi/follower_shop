import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:follower_shop/feature/store/model/moel_detail.dart';

class PageProductProvider extends ChangeNotifier {
  PageProductProvider(){
    getData();
  }
  List<DetailModel> _listItem = [];

  void getData() async {
    var response = await Dio().get('https://f.nicetel.ir/?action=items');
    List json = await jsonDecode(response.data);
    print(json.length);
    for (int i = 0; i < json.length; i++) {
      _listItem.add(new DetailModel(txt: json[i]['title'], pic: json[i]['icon'], id: int.parse(json[i]['id_p'])));
      notifyListeners();
    }
  }

  List<DetailModel> get list => _listItem;
}
