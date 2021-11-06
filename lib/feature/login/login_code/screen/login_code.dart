import 'package:follower_shop/core/styles/AppColor.dart';
import 'package:follower_shop/core/styles/TextStyles.dart';
import 'package:follower_shop/feature/login/login/valodation/valid_login.dart';
import 'package:follower_shop/feature/login/login_code/validation/code_validation.dart';
import 'package:flutter/material.dart';
import 'package:follower_shop/feature/login/widgets/my_text_field.dart';
import 'package:provider/provider.dart';

class LoginCode extends StatelessWidget {
  const LoginCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CodeValid>(context);
    var providerNumber = Provider.of<ValidLogin>(context).getNumber.value;
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: AppColor.white,
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.only(left: w * 0.067, right: w * 0.067),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  width: double.infinity,
                  child: Text('کد ورود',
                      style: TextStyles.textStyle,
                      textAlign: TextAlign.center),
                ),
                Container(
                  margin: EdgeInsets.only(top: h * 0.025, bottom: h * 0.05),
                  width: double.infinity,
                  child: Text(
                      'کد ورود به شماره همراه ' +
                          providerNumber.toString() +
                          ' ارسال گردید.',
                      style: TextStyles.textStyleDetail,
                      textAlign: TextAlign.center),
                ),
                Container(
                    margin: EdgeInsets.only(bottom: h * 0.05),
                    height: 40,
                    child: TextButton(
                      child: const Text('ویرایش شماره تلفن همراه',
                          style: TextStyles.textStyleLink,
                          textAlign: TextAlign.center),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )),
                MyTextField(
                    type: TextInputType.number,
                    max: 5,
                    label: 'کد ارسالی',
                    error: provider.codeValid.error,
                    onChanged: provider.changeCode ,
                    contexts: context , order: providerNumber, icon: null),
                SizedBox(height: h * 0.04),
                const SizedBox(
                  child: Text('کدی دریافت نکردید؟',
                      style: TextStyles.textStyleDetail),
                ),
                SizedBox(height: h * 0.025),
                provider.getTimer > 0
                    ? SizedBox(
                        width: double.infinity,
                        child: Text(
                          provider.getTimer.toString() +
                              '  مانده تا دریافت مجدد کد',
                          style: TextStyles.textStyleDetail,
                          textAlign: TextAlign.center,
                        ),
                      )
                    : SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              provider.resendNumber(providerNumber);
                              provider.resend();
                            },
                            child: const Text('دریافت مجدد کد')),
                      )
              ],
            ),
          ),
        ));
  }
}
