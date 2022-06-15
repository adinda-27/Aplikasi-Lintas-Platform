import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
// ignore: unused_import
import 'package:shop_app/enums.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "                Profile",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
