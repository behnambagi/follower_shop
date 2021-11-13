import 'package:follower_shop/feature/login/login/valodation/valid_login.dart';
import 'package:follower_shop/feature/login/login_code/validation/code_validation.dart';
import 'package:follower_shop/feature/splash/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:follower_shop/feature/store/provider/page_product_provider.dart';
import 'package:provider/provider.dart';
import 'core/styles/AppColor.dart';
import 'feature/home/home_main/provider/home_provider.dart';

void main() {

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => PageProductProvider()),
      ChangeNotifierProvider(create: (_) => HomeProvider()),
      ChangeNotifierProvider(create: (_) => ValidLogin()),
      ChangeNotifierProvider(create: (_) => CodeValid()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: 'font-iran',
          backgroundColor: AppColor.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColor.white,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(color: AppColor.lighter_purple),
            actionsIconTheme: IconThemeData(color: AppColor.lighter_purple),
          )),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('fa'), // Persian, no country code
      ],
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}
