import 'dart:convert';
import 'package:follower_shop/feature/login/model/ModelValid.dart';
import 'package:follower_shop/core/AppData.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ValidLogin extends ChangeNotifier {
  ModelValid _number = ModelValid(null, null);
  bool _isValid = false;

  void changeNumber(String value) {
    if(value.length>1)  {
      if (int.parse(value[0]) == 0 && int.parse(value[1]) == 9) {
        if (value.length == 11) {
          _number = ModelValid(value, null);
          _isValid = true;
        } else {
          _number = ModelValid(null, 'شماره نباید کمتر از 11 رقم باشد.');
        }
      } else {
        _number =
            ModelValid(null, 'شماره خود را به صورت 09... وارد کنید.');
      }
    }
    notifyListeners();
  }

  void sendNumber() async {
    try {
      String url = AppData.urlServer+'/login/' ;
        var response =  await http.post(Uri.parse(url), body: {'mobile':getNumber.value,});
        var json = jsonDecode(response.body);
        print(json['data']['code']);
    }catch (error) {
      _number = ModelValid(null, 'اینترنت و یا سرور دچار مشکل شده است.');
    }
    notifyListeners();

  }

  ModelValid get getNumber => _number;

  bool get isValid => _isValid;
}
