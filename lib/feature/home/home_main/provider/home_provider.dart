import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:follower_shop/feature/home/home_list/model/model_home.dart';


class HomeProvider extends ChangeNotifier{

  HomeProvider() {
    getData();
  }

  List<HomeModel> _listItem = [];
  late HomeModel _activeItem;

  void getData() async{
    var response = await Dio().get('https://f.nicetel.ir/?action=lists');
    List json = await jsonDecode(response.data);
    for (int i = 0; i < json.length; i++) {
      _listItem.add(new HomeModel(
        id: int.parse(json[i]['id']),
        title: json[i]['title'],
        pic: json[i]['icon'],
        price: int.parse(json[i]['price']),
        color: json[i]['color'],
      ));
      notifyListeners();
    }
  }
  void setActive(HomeModel setActive)=>_activeItem=setActive;
  HomeModel get getActive=>_activeItem;
  List<HomeModel> get list => _listItem;
}