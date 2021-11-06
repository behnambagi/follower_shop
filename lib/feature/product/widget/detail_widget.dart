import 'package:follower_shop/core/styles/AppColor.dart';
import 'package:follower_shop/feature/Lists/provider/provider_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<MyStore>(context);
    return Container(
      width: MediaQuery.of(context).size.width *0.77,
      height: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: AppColor.pale_lilac),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0 , right: 5),
                    child: Icon(Icons.support),
                  ),
                  Text(p.getActive.supports),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0 , right: 5),
                    child: Icon(Icons.card_giftcard),
                  ),
                  Text(p.getActive.gift),
                ],
              ),Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0 , right: 5),
                    child: Icon(Icons.card_giftcard),
                  ),
                  Text(p.getActive.gift),
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0 , right: 5),
                    child: Icon(Icons.speed),
                  ),
                  Text(p.getActive.speed),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0 , right: 5),
                    child: Icon(Icons.password),),
                  Text(p.getActive.pass),
                ],
              ), Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0 , right: 5),
                    child: Icon(Icons.password),),
                  Text(p.getActive.pass),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
