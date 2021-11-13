import 'package:follower_shop/core/styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:follower_shop/feature/store/provider/page_product_provider.dart';
import 'package:provider/provider.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<PageProductProvider>(context);
    var icon =IconData(int.parse(p.list[index].pic), fontFamily: 'MaterialIcons');
    return Row(
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 4.0, right: 4.0),
            child: Icon(icon)),
        Text(p.list[index].txt, style: TextStyles.textStyleDetail3),
      ],
    );
  }
}
