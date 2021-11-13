import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:follower_shop/core/styles/AppColor.dart';
import 'package:follower_shop/core/styles/TextStyles.dart';
import 'package:follower_shop/feature/home/home_list/provider/home_provider.dart';
import 'package:follower_shop/feature/product/widget/detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    var store = Provider.of<HomeProvider>(context);
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: w * 0.77,
              height: h * 0.40,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 10,
                    child: Container(
                        width: w * 0.74,
                        height: h * 0.30,
                        decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                  color: const Color(0x40000000),
                                  offset: Offset(0, 4),
                                  blurRadius: 4,
                                  spreadRadius: 0)
                            ],
                            color: AppColor.light_pink)),
                  ),
                  Positioned(
                    top: 20,
                    left: 10,
                    child:  Container(
                      width: 120,
                      height: 120,
                      color: Colors.transparent,
                      child: SvgPicture.network(
                        store.getActive.pic,
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 40,
                      left: 50,
                      child: Column(
                        children: [
                          SizedBox(
                              width: w * 0.77,
                              child: Text(
                                store.getActive.price.toString() + 'تومان',
                                style: TextStyles.textStyle,
                                textAlign: TextAlign.left,
                              )),
                          SizedBox(
                              width: w * 0.77,
                              child: Text(
                                store.getActive.title,
                                style: TextStyles.textStyleDetail3,
                                textAlign: TextAlign.left,
                              )),
                        ],
                      )),
                  Positioned(
                      bottom: 12,
                      right: 12,
                      child: Icon(
                        Icons.add_circle,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            DetailProduct()
          ],
        ),
      ),
    );
  }
}
