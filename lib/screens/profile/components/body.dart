import 'package:flutter/material.dart';
import 'package:shop_app/screens/profile/components/about.dart';
import 'package:shop_app/screens/profile/components/help.dart';
import 'package:shop_app/screens/profile/components/setting.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "Setting Account",
            icon: "assets/icons/User Icon.svg",
            press: () => Navigator.pushNamed(context, Setting.routeName),
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Settings.svg",
            press: () => Navigator.pushNamed(context, Help.routeName),
          ),
          ProfileMenu(
            text: "About",
            icon: "assets/icons/Question mark.svg",
            press: () => Navigator.pushNamed(context, About.routeName),
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () => Navigator.pushNamed(context, SignInScreen.routeName),
          ),
        ],
      ),
    );
  }
}
