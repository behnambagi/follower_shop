import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Cart.dart';


class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  ViewMyCart createState() => ViewMyCart();
}

class ViewMyCart extends State<CartView> {


  List<Map<String,dynamic>> listItemCart = [];
  ViewMyCart() {
    _getProductData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('سبد خرید'),
            centerTitle: false,
            actions: [
              listItemCart.length>0?
              IconButton(
                  onPressed: () {
                    setState(() {
                      Cart.removeAllProduct();
                      listItemCart.clear();

                    });


                  }, icon: Icon(Icons.delete)) : SizedBox()
            ]),

      body: Container(child: listItemCart.length>0 ?


          Container(child: ListView.builder(itemBuilder: (context,index)=> cartRow(index),itemCount: listItemCart.length,))


          :  Container(child: Center(child:Text('سبد شما خالی است!' , style: TextStyle(fontSize: 17),),),)


      ),
      );
  }
  void _getProductData() {
    Cart.getProductCart().then((value) {
      List<String> idPs= value!.split("_");
        for(int i=0;i<(idPs.length-1);i++){
        String id =idPs[i];
        Cart.getCartData(id).then((value) {
        setState(() {
        listItemCart.add(value!);

          });
        });

      }

    });


  }

  Widget cartRow(int index,){
    
    String title = listItemCart[index]['title'];
    String title2=title.length>20 ? title.substring(0,20) +"..." :title;

    var formatter = NumberFormat('###,###');
    String price = formatter.format(listItemCart[index]['price']).toString()+'تومان';
    int priceTotal= listItemCart[index]['price']* listItemCart[index]['number'];
    String priceOneStringTotal = formatter.format(priceTotal).toString()+'تومان';

    return Padding(
      padding: const EdgeInsets.only(bottom: 5, left: 4,right: 4 ,top: 2),
      child: Container(
padding: EdgeInsets.only(top: 5 ,left: 2 ,right: 2,bottom: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white,
        ),
        child: Column(children: [
            Row(children: [
            Expanded(
                child: Image.network(listItemCart[index]['imgUrl'] , )),
            Expanded(child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text(title2),
            )),
              Expanded(
                child: Row(
                    children:[

                IconButton(icon: Icon(Icons.add), onPressed: () {
                  Cart.changeNumberProductAdd(listItemCart[index]['idProduct']).then((value){
                    if(value){
                      setState(() {
                        int n = listItemCart[index]['number'];
                        n=n+1;
                        listItemCart[index]['number']=n;
                      });

                    }

                  });

                },),
                Text(listItemCart[index]['number'].toString()),
                IconButton(icon: Icon(Icons.remove), onPressed: () {
                  Cart.changeNumberProductRemove(listItemCart[index]['idProduct']).then((value){
                    if(value){
                      setState(() {
                        int n = listItemCart[index]['number'];
                        if(n>1){
                          n=n-1;
                          listItemCart[index]['number']=n;
                        }else{
                          listItemCart.removeAt(index);
                        }

                      });

                    }

                  });

                },)



              ]),
              ),
            IconButton(color: Colors.red,
              icon: Icon(Icons.delete),
                onPressed: (){
              setState(() {
                Cart.removeOneProduct(listItemCart[index]['idProduct']);
                listItemCart.removeAt(index);
              });


            })
          ],),

        Container(
          padding: EdgeInsets.all(5),
          color: Colors.blue[50]
              , child: Row(
          children: [
            Expanded(child: Text('قیمت واحد:' , style: TextStyle(fontSize: 15),)),
            Expanded(child: Text(price , style: TextStyle(fontSize: 15 , color: Colors.green , ),textAlign: TextAlign.left,))
          ],
        ),
        ),
        Divider(height: 2,),
         Container(
            padding: EdgeInsets.all(5),
            color: Colors.blue[50]
            , child: Row(
            children: [
              Expanded(child: Text('قیمت کل:' , style: TextStyle(fontSize: 17),)),
              Expanded(child: Text(priceOneStringTotal , style: TextStyle(fontSize: 17 , color: Colors.green),textAlign: TextAlign.left,))
            ],
          ),
          ),

      ],)
        ,),
    ) ;
    
    

  }




   }

