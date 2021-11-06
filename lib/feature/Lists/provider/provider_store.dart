import 'package:follower_shop/feature/Lists/model/model_follower.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

class MyStore extends ChangeNotifier {
  List<ModelFollower> _listFollower = [];
  List<ModelFollower> _listCart = [];
  late ModelFollower _activeProduct;

  void getData(String page) async {
    var response = await Dio().get('http://f.nicetel.ir/?action=$page');
    List json = await convert.jsonDecode(response.data);
    for (int i = 0; i < json.length; i++) {
      _listFollower.add(new ModelFollower(
        id: int.parse(json[i]['id']),
        title: json[i]['title'],
        pic: json[i]['imgUrl'],
        price: int.parse(json[i]['price']),
        supports: json[i]['supports'],
        gift: json[i]['gift'],
        pass: json[i]['pass'],
        speed: json[i]['speed'],
      ));
      notifyListeners();
    }
  }
  void setActive(ModelFollower setActive)=>_activeProduct=setActive;
  ModelFollower get getActive=>_activeProduct;

  List<ModelFollower> get listFollower => _listFollower;
}
