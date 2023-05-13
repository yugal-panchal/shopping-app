import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seek_assesment/views/cart_screen.dart';
import 'package:seek_assesment/views/explore_products_screen.dart';
import 'package:seek_assesment/views/product_list_screen.dart';
import 'package:seek_assesment/views/profile_screen.dart';
import 'package:seek_assesment/views/wishlist_screen.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  List<Widget> widgetList = [];

  @override
  void initState() {
    widgetList = [
      ExploreProducts(),
      const ProductListing(),
      const CartScreen(),
      const WishlistScreen(),
      const ProfileScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 1),
      appBar: getAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        elevation: 10,
        items: [
          BottomNavigationBarItem(
            label: "",
            activeIcon: SvgPicture.asset("assets/icons/explore.svg"),
            icon: SvgPicture.asset(
              "assets/icons/explore.svg",
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            activeIcon: SvgPicture.asset("assets/icons/list.svg",
                color: const Color.fromRGBO(190, 138, 255, 1)),
            icon: SvgPicture.asset("assets/icons/list.svg"),
          ),
          BottomNavigationBarItem(
            label: "",
            activeIcon: SvgPicture.asset("assets/icons/cart.svg",
                color: const Color.fromRGBO(190, 138, 255, 1)),
            icon: SvgPicture.asset("assets/icons/cart.svg"),
          ),
          BottomNavigationBarItem(
            label: "",
            activeIcon: SvgPicture.asset("assets/icons/heart.svg",
                color: const Color.fromRGBO(190, 138, 255, 1)),
            icon: SvgPicture.asset("assets/icons/heart.svg"),
          ),
          BottomNavigationBarItem(
            label: "",
            activeIcon: SvgPicture.asset("assets/icons/profile.svg",
                color: const Color.fromRGBO(190, 138, 255, 1)),
            icon: SvgPicture.asset("assets/icons/profile.svg"),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => navBarTapped(index),
      ),
      body: widgetList[_selectedIndex],
    );
  }

  void navBarTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  AppBar getAppBar() {
    switch (_selectedIndex) {
      case 0:
        return AppBar(
          centerTitle: true,
          titleSpacing: 10,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(top:10),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/icons/menu.svg"),
            ),
          ),
          title: Container(
            width: double.infinity,
            height: 50,
            padding: const EdgeInsets.only(top:10),
            child: const TextField(
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(color: Colors.white),),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(color: Colors.white)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(color: Colors.white,width: 0)),
                filled: true,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                hintText: "Search Product",
                fillColor: Colors.white,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        );
      default:
        return AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(top:10),
            child: IconButton(
              onPressed: () {
              },
              icon: SvgPicture.asset("assets/icons/menu.svg"),
            ),
          ),
        );
    }
  }
}
