import 'package:follower_shop/core/styles/AppColor.dart';
import 'package:follower_shop/feature/Lists/provider/provider_store.dart';
import 'package:follower_shop/feature/product/widget/detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    var store = Provider.of<MyStore>(context);
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(),
      body: Center(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
            children: [Container(
                width: w*0.77,
                height: h*0.25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(20)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x40000000),
                        offset: Offset(0,4),
                        blurRadius: 4,
                        spreadRadius: 0
                    )] ,
                    color: AppColor.light_pink
                )
           ,child: Column(
              children: [
                Image.network(store.getActive.pic , width: w*0.77,
                height: h*0.05,)
              ],
            ), ),
            DetailProduct()
            ],
        ),
      ),
    );
  }
}
