import 'dart:async';
import 'dart:convert';
import 'package:follower_shop/feature/login/model/ModelValid.dart';
import 'package:follower_shop/core/AppData.dart';
import 'package:follower_shop/feature/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CodeValid extends ChangeNotifier {
  CodeValid() {
    timerCode();
  }

  ModelValid _code = ModelValid(null, null);
  int _count = 120;
void resend (){
  _count=240;
  notifyListeners();
}
  void changeCode(String code, BuildContext context, number) async {
    if (code.length == 5) {
      _code = ModelValid(code, null);

      var response = await http.post(Uri.parse(AppData.urlServer + '/code/'),
          body: {'mobile': '09397812354', 'code_user': codeValid.value});
      var json = jsonDecode(response.body);
      if (json['meta']['status'] == true) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', json['data']['token']);
        prefs.setString('mobile', '09397812354');
        AppData.go(context, HomeScreen(), 1, 1);
      } else {
        _code = ModelValid(null, 'کد معتبر نیست !');
      }
    } else {
      _code = ModelValid(null, 'کد باید 5 عدد باشد');
    }
  }

  void timerCode() {
    late Timer _timer;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_count > 0) {
        _count--;
      } else {
        _timer.cancel();
      }
      notifyListeners();
    });
  }

  void resendNumber(number) async {
    await http.post(Uri.parse(AppData.urlServer + 'recode'),
        body: {'mobile': number});
  }

  get getTimer => _count;

  ModelValid get codeValid => _code;
}
