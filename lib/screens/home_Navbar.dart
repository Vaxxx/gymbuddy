import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymbuddy/screens/home.dart';
import 'package:gymbuddy/screens/user/login.dart';
import 'package:gymbuddy/screens/user/register.dart';
import 'package:gymbuddy/utils/dimensions.dart';
import 'package:gymbuddy/utils/page_widget.dart';

class HomeNavDrawer extends StatelessWidget {
  const HomeNavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Dimensions.deepBlueColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(color: Dimensions.deepBlueColor),
            child: Padding(
              padding: EdgeInsets.all(Dimensions.height20),
              child: PageWidget.textWidget(
                  textLabel: 'GYM BUDDY',
                  fontFamily: 'Montserrat',
                  fontSize: Dimensions.height30,
                  fontWeight: FontWeight.w700,
                  textColor: Dimensions.whiteColor),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.login,
              color: Dimensions.whiteColor,
            ),
            title: PageWidget.textWidget(
                textLabel: "Login",
                fontFamily: 'Montserrat',
                fontSize: Dimensions.height20,
                fontWeight: FontWeight.w700,
                textColor: Dimensions.whiteColor),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Login(),
              ));
            },
          ),
          ListTile(
              leading: const Icon(Icons.app_registration,
                  color: Dimensions.whiteColor),
              title: PageWidget.textWidget(
                  textLabel: "Register",
                  fontFamily: 'Montserrat',
                  fontSize: Dimensions.height20,
                  fontWeight: FontWeight.w700,
                  textColor: Dimensions.whiteColor),
              onTap: () => Get.to(() => Register())),
          // ListTile(
          //   title: Text('Exit'),
          //   onTap: () {
          //     Navigator.of(context).push(MaterialPageRoute(
          //       builder: (BuildContext context) => HomePage(),
          //     ));
          //   },
          // ),
          const Divider(color: Dimensions.lightGreyColor),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app,
              color: Dimensions.whiteColor,
            ),
            title: PageWidget.textWidget(
                textLabel: "Exit",
                fontFamily: 'Montserrat',
                fontSize: Dimensions.height20,
                fontWeight: FontWeight.w700,
                textColor: Dimensions.whiteColor),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => HomePage(),
              ));
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.bookmark_border),
          //   title: Text('Bookmark'),
          //   onTap: () {
          //     Navigator.of(context).push(MaterialPageRoute(
          //       builder: (BuildContext context) => Bookmark(),
          //     ));
          //   },
          // ),
          // ListTile(
          //   leading: Icon(Icons.settings),
          //   title: Text('Settings'),
          //   onTap: () {
          //     Navigator.of(context).push(MaterialPageRoute(
          //       builder: (BuildContext context) => Settings(),
          //     ));
          //   },
          // ),
        ],
      ),
    );
  }
}
