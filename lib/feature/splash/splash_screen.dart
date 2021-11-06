import 'package:follower_shop/core/styles/AppColor.dart';
import 'package:follower_shop/core/AppData.dart';
import 'package:follower_shop/feature/home/home_screen.dart';
import 'package:follower_shop/feature/login/login/screen/LoginScreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final Future<Widget?> _initFuture = AppData.initialize();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget?>(
      future: _initFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if(AppData.status){
            return const HomeScreen();
          }else{
            return const LoginScreen();
          }
        } else {
          return Scaffold(
            backgroundColor: AppColor.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                      height: 200 ,
                      color: Colors.transparent,
                      child: Image.asset('images/apple.png')),
                  const SizedBox(
                    height: 25,
                  ),
                  const CircularProgressIndicator()
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
