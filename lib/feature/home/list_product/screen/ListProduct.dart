import 'package:follower_shop/feature/home/list_product/model/product_model.dart';
import 'package:follower_shop/feature/home/slider/sliderhomeProcuct.dart';
import 'package:follower_shop/feature/product/page_product/Product_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:intl/intl.dart';

class ProductMain extends StatefulWidget {
  const ProductMain({Key? key}) : super(key: key);

  @override
  _ProductMainState createState() => _ProductMainState();
}

class _ProductMainState extends State<ProductMain> {
  List<ProductModel> newProduct = [];
  List<ProductModel> bestSellers = [];
  List<ProductModel> star = [];

  @override
  Widget build(BuildContext context) {
    void getProducts(String action, List<ProductModel> list) async {
      var url = Uri.parse("http://f.nicetel.ir/?action=" + action);
      if (list.length == 0) {
        await http.get(url).then((response) {
          if (response.statusCode == 200) {
            List jason = convert.jsonDecode(response.body);
            for (int a = 0; a < jason.length; a++) {
              setState(() {
                list.add(new ProductModel(
                    jason[a]["title"],
                    int.parse(jason[a]["price"]),
                    jason[a]["imgUrl"],
                    int.parse(jason[a]["id"])));
              });
            }
          }
        });
      }
    }

    getProducts('new_product', newProduct);
    getProducts('porforosh1', bestSellers);
    getProducts('setare', star);

    return SingleChildScrollView(
      child: Column(
        children: [
          SliderHome(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  "محصولات اینستاگرام",
                )),
                Expanded(
                    child: Text(
                  "نمایش همه >",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.blue),
                )),
              ],
            ),
          ),
          newProduct.length > 0
              ? Container(
                  height: 230,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: item,
                    itemCount: newProduct.length,
                    scrollDirection: Axis.horizontal,
                  ),
                )
              : Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                  height: 250,
                ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(child: Text("پرفروش ترین اینستاگرام")),
                Expanded(
                    child: Text(
                  "نمایش همه >",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.blue),
                ))
              ],
            ),
          ),
          bestSellers.length > 0
              ? Container(
                  height: 230,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: item1,
                    itemCount: bestSellers.length,
                    scrollDirection: Axis.horizontal,
                  ))
              : Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                  height: 250,
                ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(child: Text("محصولات پیشنهادی")),
                Expanded(
                    child: Text(" نمایش همه >",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.blue)))
              ],
            ),
          ),
          star.length > 0
              ? Container(
                  height: 230,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: item2,
                    itemCount: star.length,
                    scrollDirection: Axis.horizontal,
                  ))
              : Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                  height: 250,
                ),
        ],
      ),
    );
  }

  Widget item(BuildContext context, int index) {
    return productListMain(index, newProduct);
  }

  Widget item1(BuildContext context, int index) {
    return productListMain(index, bestSellers);
  }

  Widget item2(BuildContext context, int index) {
    return productListMain(index, star);
  }

  Widget productListMain(int index, List<ProductModel> list) {
    String price1 = "";
    String toman = " تومان ";
    var f = new NumberFormat("###,###");
    price1 = f.format(list[index].price) + toman;
    String title = list[index].title.length > 25
        ? list[index].title.substring(0, 25) + "..."
        : list[index].title;

    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(left: 1.5, right: 1.5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white,
        ),
        width: 250,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8), topLeft: Radius.circular(8)),
              child: Image.network('${list[index].imgUrl}'),
            ),
            Container(
              margin: EdgeInsets.only(right: 15, top: 10, bottom: 2),
              child: Text(
                title,
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 15.5),
              ),
              width: 250,
            ),
            Divider(
              color: Colors.black12,
              thickness: 1,
            ),
            Container(
              margin: EdgeInsets.only(left: 15, top: 6.5),
              child: Text(price1,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18, color: Colors.green)),
              width: 250,
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PageProduct(list[index].id)));
      },
    );
  }
}
