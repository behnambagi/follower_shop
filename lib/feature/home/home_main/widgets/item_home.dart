import 'package:follower_shop/core/AppData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:follower_shop/feature/home/home_list/provider/home_provider.dart';
import 'package:follower_shop/feature/store/screen/product_screen.dart';
import 'package:provider/provider.dart';

class ItemHome extends StatelessWidget {
  ItemHome({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<HomeProvider>(context);
    var _color = Color(int.parse(p.list[index].color));
    return Padding(
      padding: EdgeInsets.only(left: 20 , right: 20 , top: 10 , bottom: 10),
      child: GestureDetector(
        onTap: () {
          AppData.go(context, ProductScreen(), 1, 1);
          p.setActive(p.list[index]);

        },
        child: Container(
          decoration: BoxDecoration(
              color: _color, borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 90,
                height: 90,
                color: Colors.transparent,
                child: SvgPicture.network(
                  p.list[index].pic,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(p.list[index].title)
            ],
          ),
        ),
      ),
    );
  }
}
