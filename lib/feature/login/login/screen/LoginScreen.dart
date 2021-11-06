import 'package:follower_shop/core/styles/AppColor.dart';
import 'package:follower_shop/core/styles/TextStyles.dart';
import 'package:follower_shop/core/AppData.dart';
import 'package:follower_shop/feature/login/widgets/my_text_field.dart';
import 'package:follower_shop/feature/login/login/valodation/valid_login.dart';
import 'package:follower_shop/feature/login/login_code/screen/login_code.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    var provider = Provider.of<ValidLogin>(context);

    return Scaffold(backgroundColor: AppColor.white,
    appBar: AppBar(),
    body: Container(
        margin: EdgeInsets.symmetric(horizontal: w*0.056),
        child: SingleChildScrollView(
          child: Column(

            children: [
              const SizedBox(
                width: double.infinity,
                child: Text("ورود به برنامه",
                    style: TextStyles.textStyle,
                    textAlign: TextAlign.center),
              ),
              Container(
                margin: EdgeInsets.only(top: h * 0.025, bottom: h * 0.05),
                width: double.infinity,
                child: const Text(
                    "چنانچه عضو لیما هستید و یا قصد ثبت نام در برنامه را دارید شماره تلفن همراه خود را وارد نمایید تا کد امنیتی برای شما ارسال گردد",
                    style: TextStyles.textStyleDetail,),
              ),
              MyTextField(
                  max: 11,
                  type: TextInputType.number,
                  onChanged: provider.changeNumber,
                  error: provider.getNumber.error,
                  label: 'شماره تلفن',
                  icon: const Icon(Icons.call)),
              SizedBox(height: h * 0.04),
              RichText(
                text: TextSpan(
                  text: 'آغاز استفاده از برنامه توسط شما به منزله پذیرش',
                  style: TextStyles.textStyleDetail,
                  children: [
                    TextSpan(
                      text: ' قوانین برنامه لیما',
                      style: TextStyles.textStyleLink,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Navigator.pushNamed(context, '/login/code/detail');
                        },
                    ),
                    const TextSpan(
                        text: ' می‌باشد.', style: TextStyles.textStyleDetail),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: h * 0.21),
                width: 56,
                height: 56,
                color: provider.isValid ? AppColor.lighter_purple : AppColor.blue_grey,
                child: IconButton(
                  onPressed: () {
                    if (provider.isValid) {
                     provider.sendNumber();
                     AppData.go(context, LoginCode(), 1, 1);
                    }
                  },
                  icon: Icon(Icons.arrow_back,
                      color: provider.isValid
                          ? AppColor.black
                          : AppColor.dark_indigo),
                ),
              ),
            ],
          ),
        ),));
  }
}
