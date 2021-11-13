import 'package:follower_shop/core/styles/AppColor.dart';
import 'package:follower_shop/core/styles/TextStyles.dart';
import 'package:follower_shop/feature/Lists/provider/provider_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<MyStore>(context);
    var w = MediaQuery.of(context).size.width;
    return Container( 
      padding: EdgeInsets.all(10),
      width:  w* 0.70,
      height: 100,
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
                    padding: const EdgeInsets.only(left: 5.0, right: 5),
                    child: Icon(Icons.support),
                  ),
                  Text(
                    'داراي پشتيباني',
                    style: TextStyles.textStyleDetail3,
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5),
                    child: Icon(Icons.card_giftcard),
                  ),
                  Text('100 تا هديه', style: TextStyles.textStyleDetail3),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5),
                    child: Icon(Icons.card_giftcard),
                  ),
                  Text('100 تا هديه', style: TextStyles.textStyleDetail3),
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
                    padding: const EdgeInsets.only(left: 5.0, right: 5),
                    child: Icon(Icons.speed),
                  ),
                  Text('كمترين زمان', style: TextStyles.textStyleDetail3),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5),
                    child: Icon(Icons.password),
                  ),
                  Text('بدون پسورد', style: TextStyles.textStyleDetail3),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5),
                    child: Icon(Icons.password),
                  ),
                  Text('بدون پسورد', style: TextStyles.textStyleDetail3),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
