import 'package:follower_shop/feature/home/profile/screen/profile_screen.dart';
import 'package:flutter/material.dart';

import 'home_main/screen/home_main.dart';
import 'list_product/screen/ListProduct.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  List<Widget> navigation = [

    HemeMain(),
    ProductMain(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          height: h*0.11,
          child: BottomNavigationBar(
            selectedItemColor: Color.fromRGBO(111, 108, 217, 1),
            backgroundColor: Colors.white,
            elevation: 5,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'خانه',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.anchor_sharp),
                label: 'دوره ها',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'پروفايل',
              ),
            ],
            currentIndex: _index,
            onTap: (int index) {
              setState(() {
                _index = index;
              });
            },
          ),
        ),
        body: navigation.elementAt(_index));
  }
}
