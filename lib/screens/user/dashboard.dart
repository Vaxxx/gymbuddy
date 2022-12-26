import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymbuddy/screens/dashboard_drawer.dart';
import 'package:gymbuddy/screens/user/login.dart';
import 'package:gymbuddy/screens/user/register.dart';
import 'package:gymbuddy/utils/dimensions.dart';
import 'package:gymbuddy/utils/page_widget.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Dimensions.deepBlueColor,
      drawer: const DashboardDrawer(),
      appBar: AppBar(
        title: PageWidget.textWidget(
            textLabel: "DASHBOARD",
            fontFamily: "Montserrat",
            fontSize: Dimensions.height20,
            fontWeight: FontWeight.w800,
            textColor: Dimensions.whiteColor),
        centerTitle: true,
        actions: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.settings_outlined),
                onPressed: () => Get.toNamed('settings'),
              ),
              IconButton(
                icon: const Icon(Icons.exit_to_app_outlined),
                onPressed: () => Get.toNamed('homePage'),
              ),
            ],
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 224,
                      width: double.infinity,
                      color: Dimensions.indigoColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: CircleAvatar(
                          backgroundColor: Dimensions.whiteColor,
                          radius: Dimensions.height60,
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/placeholder.png",
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  login() {
    debugPrint('login');
    Get.to(() => Login());
  } //login

  register() {
    debugPrint('register');
    Get.to(() => Register());
  }

  settings() {
    debugPrint('Settings');
  }
}
