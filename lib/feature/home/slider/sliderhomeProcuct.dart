import 'package:follower_shop/core/AppData.dart';
import 'package:follower_shop/feature/product/page_product/Product_Page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class SliderModel {
  String imgUrl;
  int id;

  SliderModel(this.imgUrl, this.id);
}


class SliderHome extends StatefulWidget {
  const SliderHome({Key? key}) : super(key: key);

  @override
  _SliderHomeState createState() => _SliderHomeState();
}

class _SliderHomeState extends State<SliderHome> {

  List<SliderModel> slid = [];
  int positionSlider=0;

  void getSlider() {
    var url = Uri.parse("http://f.nicetel.ir/?action=sliders");
    if (slid.length == 0) {
      http.get(url).then((value) {
        print(value.statusCode);
        if (value.statusCode == 200) {
          List jason = convert.jsonDecode(value.body);
          for (int a = 0; a < value.statusCode; a++) {
            setState(() {
              slid.add(SliderModel(jason[a]["img_Url"] , int.parse(jason[a]["id"])));
            });
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    getSlider();
    return Container(
      height: 200,
      child: slid.length > 0
          ?
      Stack(
        children: [
          PageView.builder(
            itemBuilder: slidItem,
            itemCount: slid.length,
            onPageChanged: (index){
              setState(() {
                positionSlider=index;
              });
            },
          ),
          Container(child:
          slidFotter()
            ,margin: EdgeInsets.only(top: 170),)
        ],
      )

          : Center(
        child: CircularProgressIndicator(),
      ),
    );


  }


  Widget slidItem(BuildContext context, index) {
    return GestureDetector(
      child: Image(
        image: NetworkImage('${slid[index].imgUrl}'),
        fit: BoxFit.cover,
      ),
      onTap: () {
        return AppData.go(context, PageProduct(slid[index].id), 1, 0);
      },
    );
  }
  Widget slidFotter(){
    List<Widget> listSlider=[];
    for(int a=0;a<slid.length;a++){
      a==positionSlider? listSlider.add(_active()):listSlider.add(_unActive());
    }

    return Row(children: listSlider
      ,mainAxisAlignment: MainAxisAlignment.center,);
  }
  Widget _active (){
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        width: 10,
        height: 10,
      ),
    );
  }  Widget _unActive (){
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        width: 10,
        height: 10,
      ),
    ) ;
  }
}
