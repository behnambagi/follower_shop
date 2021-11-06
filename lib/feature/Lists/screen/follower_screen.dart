import 'package:follower_shop/core/styles/AppColor.dart';
import 'package:follower_shop/core/AppData.dart';
import 'package:follower_shop/feature/Lists/provider/provider_store.dart';
import 'package:follower_shop/feature/cart/CartScreen.dart';
import 'package:follower_shop/feature/product/screen/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class FollowerScreen extends StatelessWidget {
  const FollowerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyStore>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                AppData.go(context, CartView(), 1, 1);
              },
              icon: Icon(Icons.shopping_cart_rounded),
              tooltip: "سبد خرید"),
        ],
      ),
      body: provider.listFollower.length > 0
          ? GridView.builder(
        itemCount: provider.listFollower.length,
        itemBuilder: (BuildContext context, int index) {
          return modelCart(context, index);
        },
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget modelCart(BuildContext context, int index) {
    var store = Provider.of<MyStore>(context);
    var f = new NumberFormat("###,###");
    String title = store.listFollower[index].title.length > 25
        ? store.listFollower[index].title.substring(0, 25) + "..."
        : store.listFollower[index].title;
    var price = f.format(store.listFollower[index].price) + 'تومان';
    return GestureDetector(
      child: Container(
        height: 200,
        width: 200,
        child: Card(
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      topLeft: Radius.circular(8)),
                  child: FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: 110,
                      fit: BoxFit.cover,
                      placeholder: 'images/loading.gif',
                      image: store.listFollower[index].pic)),
              Container(
                  padding: EdgeInsets.all(8),
                  width: double.infinity,
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 15),
                  )),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 15, left: 15, bottom: 5),
                    width: double.infinity,
                    child: Text(
                      price,
                      style: TextStyle(fontSize: 17, color: Colors.green),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      onTap: () {
        store.setActive(store.listFollower[index]);
        AppData.go(context, ProductScreen(), 1, 1);
      },
    );
  }
}
