import 'package:follower_shop/core/styles/AppColor.dart';
import 'package:follower_shop/core/styles/TextStyles.dart';
import 'package:follower_shop/core/AppData.dart';
import 'package:follower_shop/feature/home/profile/widgets/item_widget.dart';
import 'package:follower_shop/feature/home/profile/widgets/round_shape.dart';
import 'package:follower_shop/feature/login/login/screen/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Column(
      children: [
        ClipPath(
          clipper: RoundShape(),
          child: Container(
            width: double.infinity,
            height: h * 0.29,
            color: AppColor.lighter_purple,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: w * 0.184,
                    height: w * 0.184,
                    child: SvgPicture.asset('images/home/follower.svg')),
                Padding(
                  padding: EdgeInsets.only(bottom: h * 0.06),
                  child: Text(
                    'بهنام بگوند',
                    style: TextStyles.textStyleDetailWhite,
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: w * 0.033),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: h * 0.023, bottom: h * 0.011),
                height: 50,
                child: Text(
                  'شما با شماره موبايل ${AppData.numberUser} وارد شده ايد.',
                  style: TextStyles.textStyleDetail,
                ),
              ),
              GestureDetector(
                onTap: (){
                  AppData.logOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 24,
                  width: 95,
                  decoration: BoxDecoration(
                      color: AppColor.pale_lilac_two,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Text('خروج از حساب'),
                ),
              ),
              ItemProfile(
                width: w,
                height: h,
                icon: Icons.payment,
                title: 'پرداختي هاي شما',
              ),
              ItemProfile(
                width: w,
                height: h,
                icon: Icons.note,
                title: 'نشان ها و يادداشت ها',
              ),
              ItemProfile(
                width: w,
                height: h,
                icon: Icons.settings,
                title: 'تنظيمات برنامه',
              ),
            ],
          ),
        )
      ],
    ));
  }
}
