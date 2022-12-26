import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymbuddy/screens/add_picture.dart';
import 'package:gymbuddy/screens/home.dart';
import 'package:gymbuddy/screens/location.dart';
import 'package:gymbuddy/screens/post.dart';
import 'package:gymbuddy/screens/settings.dart';
import 'package:gymbuddy/utils/dimensions.dart';
import 'package:gymbuddy/utils/page_widget.dart';

class DashboardDrawer extends StatelessWidget {
  const DashboardDrawer({Key? key}) : super(key: key);

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
              Icons.post_add,
              color: Dimensions.whiteColor,
            ),
            title: PageWidget.textWidget(
                textLabel: "Post",
                fontFamily: 'Montserrat',
                fontSize: Dimensions.height20,
                fontWeight: FontWeight.w700,
                textColor: Dimensions.whiteColor),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Post(),
              ));
            },
          ),
          ListTile(
              leading: const Icon(Icons.image, color: Dimensions.whiteColor),
              title: PageWidget.textWidget(
                  textLabel: "Add Picture",
                  fontFamily: 'Montserrat',
                  fontSize: Dimensions.height20,
                  fontWeight: FontWeight.w700,
                  textColor: Dimensions.whiteColor),
              onTap: () => Get.to(() => const AddPicture())),
          ListTile(
              leading:
                  const Icon(Icons.location_city, color: Dimensions.whiteColor),
              title: PageWidget.textWidget(
                  textLabel: "Add Current Location",
                  fontFamily: 'Montserrat',
                  fontSize: Dimensions.height20,
                  fontWeight: FontWeight.w700,
                  textColor: Dimensions.whiteColor),
              onTap: () => Get.to(() => const AddLocation())),
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
              Icons.settings_outlined,
              color: Dimensions.whiteColor,
            ),
            title: PageWidget.textWidget(
                textLabel: "Settings",
                fontFamily: 'Montserrat',
                fontSize: Dimensions.height20,
                fontWeight: FontWeight.w700,
                textColor: Dimensions.whiteColor),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => const Settings(),
              ));
            },
          ),
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
                builder: (BuildContext context) => const HomePage(),
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
