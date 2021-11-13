import 'package:follower_shop/core/AppData.dart';
import 'package:follower_shop/feature/cart/Cart.dart';
import 'package:follower_shop/feature/cart/CartScreen.dart';
import 'package:follower_shop/feature/product/comment/CommentView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PageProduct extends StatefulWidget {
 final int idProduct;

  PageProduct(this.idProduct);

  @override
  _PageProductState createState() => _PageProductState(idProduct);
}

class _PageProductState extends State<PageProduct> {
  int price = 0;
  String imgUrl = "";
  String description = "";
  String title = '';

  List<dynamic> listComment = [];

  _PageProductState(idProduct) {
    String url =
        "http://f.nicetel.ir/?action=id_product&id=" + idProduct.toString();
    http.get(Uri.parse(url)).then((value) async {
      if (value.statusCode == 200) {
        dynamic jasonResponse = await convert.jsonDecode(value.body);
        setState(() {
          title = jasonResponse['title'];
          imgUrl = jasonResponse['imgUrl'];
          price = int.parse(jasonResponse['price']);
          description = jasonResponse['description'];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Text(title.length > 25 ? title.substring(0, 30) + "..." : title),
          actions: [
            IconButton(
                onPressed: () {
                  AppData.go(context, CartView(), 1, 1);
                },
                icon: Icon(Icons.shopping_cart_rounded),
                tooltip: "سبد خرید"),
          ],
        ),
        body: title.isNotEmpty
            ? Container(
                height: MediaQuery.of(context).size.height,
                child: Stack(children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Image(image: NetworkImage(imgUrl)),
                        Container(
                          padding: EdgeInsets.only(right: 15, top: 5, left: 5),
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            title,
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                              description,
                              style: TextStyle(fontSize: 15),
                            ))
                      ],
                    ),
                  ),
                  Positioned(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                              top:
                                  BorderSide(color: Colors.black, width: .09))),
                      child: Center(
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Cart.addProduct(
                                        title,
                                        widget.idProduct.toString(),
                                        price,
                                        imgUrl)
                                    .then((value) {
                                  if (value) {
                                    AppData.go(context, CartView(), 1, 1);
                                  }
                                });
                              },
                              child: Container(
                                color: Colors.white,
                                height: 60,
                                width:
                                    MediaQuery.of(context).size.width / 2 - 2,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(price.toString() + 'تومان'),
                                    Icon(Icons.shop),
                                  ],
                                ),
                              ),
                            ),
                            VerticalDivider(
                              width: 4,
                            ),
                            GestureDetector(
                              onTap: () {
                                AppData.go(
                                    context,
                                    Comments(
                                        widget.idProduct, listComment, title), 1, 0);
                              },
                              child: Container(
                                color: Colors.white,
                                height: 60,
                                width:
                                    MediaQuery.of(context).size.width / 2 - 2,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('کامنت ها'),
                                    Icon(Icons.comment),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    bottom: 0,
                  )
                ]),
              )
            : Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ));
  }
}
