import 'package:flutter_svg/flutter_svg.dart';
import 'package:follower_shop/core/styles/AppColor.dart';
import 'package:follower_shop/feature/home/home_list/widgets/item_home.dart';
import 'package:flutter/material.dart';

class HemeList extends StatelessWidget {
  const HemeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Column(children: [
      Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                spreadRadius: 10,
                blurRadius: 7,
              ),
            ],
            color: AppColor.light_blue_grey,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        width: MediaQuery.of(context).size.width,
        height: h * .22,
        child: Stack(
          children: [
            Positioned(
                bottom: 20,
                right: 20,
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: SvgPicture.asset('images/home/follower.svg'),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      children: [
                        Text(
                          'سلام بهنام!!',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text('شما کاربر عادي هستيد هستید!'),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
      Container(
        height: h - h * 0.33,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 28, bottom: 28),
                  width: double.infinity,
                  height: 275,
                  child: Stack(children: [
                    Positioned(
                      child: Container(
                        width: double.infinity,
                        height: 224,
                        decoration: BoxDecoration(
                            color: AppColor.periwinkle,
                            borderRadius:
                                BorderRadius.all(Radius.circular(24))),
                      ),
                    ),
                    Positioned(
                        bottom: 2,
                        left: (MediaQuery.of(context).size.width - 40) / 2 - 50,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white, // border color
                            shape: BoxShape.circle,
                          ),
                        )),
                    Positioned(
                        bottom: 20,
                        left: (MediaQuery.of(context).size.width - 40) / 2 -
                            32.82,
                        child: Container(
                          width: 65.64,
                          height: 65.64,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.12),
                                spreadRadius: 15,
                                blurRadius: 25,
                              )
                            ],
                            color: AppColor.lighter_purple,
                            // border color
                            shape: BoxShape.circle,
                          ),
                          child: Transform.rotate(
                            angle: 37,
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.logout,
                                  size: 25,
                                  color: Colors.white,
                                )),
                          ),
                        )),
                    Positioned(
                        top: 20,
                        left: 25,
                        child: Image.asset('images/imgHome.png')),
                    Positioned(
                        top: 40,
                        right: 25,
                        child: Text(
                          'فالوور ارزان اینستاگرام امروز \nدارای تخفیف است!',
                          style: TextStyle(fontSize: 17),
                        ))
                  ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ItemWidgets.itemHome(
                        width: 140,
                        height: 163,
                        color: AppColor.pale_lilac,
                        image: 'images/home/follower.svg',
                        title: 'فالوور اينستاگرام',
                        listName: 'follower',
                        context: context),
                    SizedBox(
                      width: 16,
                    ),
                    ItemWidgets.itemHome(
                      width: 147,
                      height: 202,
                      color: AppColor.light_pink,
                      image: 'images/home/like.svg',
                      title: 'لايك اينستاگرام',
                      context: context,
                      listName: 'follower',
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ItemWidgets.itemHome(
                      width: 130,
                      height: 160,
                      color: AppColor.very_light_pink,
                      image: 'images/home/comment.svg',
                      title: 'كامنت اينستاگرام',
                      context: context,
                      listName: 'follower',
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    ItemWidgets.itemHome(
                      width: 146,
                      height: 164,
                      color: AppColor.pale,
                      image: 'images/home/view.svg',
                      title: 'بازديد اينستاگرام',
                      context: context,
                      listName: 'follower',
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
