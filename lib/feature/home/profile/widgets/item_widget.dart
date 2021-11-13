import 'package:follower_shop/core/styles/AppColor.dart';
import 'package:follower_shop/core/styles/TextStyles.dart';
import 'package:flutter/material.dart';

class ItemProfile extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final IconData icon;

  ItemProfile(
      {Key? key,
      required this.width,
      required this.height,
      required this.title,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: height * 0.023),
      height: height * 0.075,
      decoration: BoxDecoration(
          color: AppColor.silver,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: width * 0.035, left: width * 0.02),
            child: Icon(
              icon,
              size: 24.0,
            ),
          ),
          Text(
            title,
            style: TextStyles.textStyleDetail2,
          )
        ],
      ),
    );
  }
}
