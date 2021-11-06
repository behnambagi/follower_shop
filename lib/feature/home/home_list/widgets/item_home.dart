import 'package:follower_shop/core/AppData.dart';
import 'package:follower_shop/feature/Lists/provider/provider_store.dart';
import 'package:follower_shop/feature/Lists/screen/follower_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';


class ItemWidgets {
  static itemHome(

      {required double width,
      required double height,
      required Color color,
      required String image,
        required String listName,
      required String title , required BuildContext context}) {
    var p = Provider.of<MyStore>(context);
    return GestureDetector(
      onTap: (){
        AppData.go(context, FollowerScreen(), 1, 1);
        p.getData(listName);
      },
      child: Container(
        width: width,
        height: 165,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 90,
              height: 90,
              color: Colors.transparent,
              child: SvgPicture.asset(
                image,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}
