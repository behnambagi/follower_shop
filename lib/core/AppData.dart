import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class AppData {
 static bool status = false;



  static Future<Widget?> initialize() async {
    await _loadSettings();
    await registerServices();
  }

   static Future<bool?> registerServices() async {
    // TODO: Add phone and add dio
    var response = await http.post(Uri.parse(AppData.urlServer + '/check/'),
        body: {'token': tokenApp});
    var json = jsonDecode(response.body);
    if(json['meta']['status']){
       status = true;
     }
  }

  static _loadSettings() async {
    try{
      var prefs = await SharedPreferences.getInstance();
      String? _token = prefs.getString('token');
      String? _number = prefs.getString('mobile');
      tokenApp = _token!;
      numberUser = _number!;
    }catch(e){}
    await Future.delayed(const Duration(seconds: 1));
  }

  static logOut() async{
    var prefs =await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  static String? tokenApp;
      // TODO: Add phone user in the future
  static String? numberUser='09397812354';
  static String urlServer = 'https://f.nicetel.ir';
  static go(BuildContext context, Widget screen, double x, double y) {
    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondAnimation) {
              return screen;
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween(begin: Offset(x, y), end: Offset.zero)
                    .animate(animation),
                child: child,
              );
            },
            transitionDuration: Duration(milliseconds: 500)));
  }
}
