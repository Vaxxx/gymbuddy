import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymbuddy/screens/home_Navbar.dart';
import 'package:gymbuddy/screens/user/login.dart';
import 'package:gymbuddy/screens/user/register.dart';
import 'package:gymbuddy/utils/dimensions.dart';
import 'package:gymbuddy/utils/page_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Dimensions.deepBlueColor,
      extendBodyBehindAppBar: true,
      drawer: const HomeNavDrawer(),
      body: Stack(
        children: <Widget>[
          Column(
            children: [
              Flexible(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width150,
                        vertical: Dimensions.height15),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/homebg.jpg"),
                            fit: BoxFit.cover)),
                    child: Stack(
                      children: <Widget>[
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Image.asset("assets/images/logo.jpg")),
                      ],
                    ),
                  )),
              Flexible(
                flex: 2,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      PageWidget.textWidget(
                          textLabel: "RECENT POST",
                          fontFamily: 'Montserrat',
                          fontSize: Dimensions.height20,
                          fontWeight: FontWeight.w600,
                          textColor: Dimensions.whiteColor),
                      Container(
                        margin: EdgeInsets.all(Dimensions.height10),
                        height: Dimensions.SCREEN_HEIGHT * 0.52,
                        width: Dimensions.SCREEN_WIDTH,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.height15),
                          color: Dimensions.deepBlueColor,
                        ),
                        child: Card(
                          color: Dimensions.lightBlue,
                          child: ListTile(
                            leading: const Icon(Icons.person_outline_outlined),
                            title: PageWidget.textWidget(
                                textLabel: "This is the first post",
                                fontFamily: 'Montserrat',
                                fontSize: Dimensions.height25,
                                fontWeight: FontWeight.w700,
                                textColor: Dimensions.deepBlueColor),
                            subtitle: PageWidget.textWidget(
                                textLabel:
                                    "This is the first post with a lot on the analysis resulting to the comprehension of the post",
                                fontFamily: 'Montserrat',
                                fontSize: Dimensions.height20,
                                fontWeight: FontWeight.w400,
                                textColor: Dimensions.lightGreyColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Dimensions.height5, horizontal: Dimensions.width10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  PageWidget.elevatedButton(
                      onPressed: login,
                      buttonText: "LOGIN",
                      icon: const Icon(Icons.login_rounded,
                          color: Dimensions.deepBlueColor)),
                  PageWidget.elevatedButton(
                      onPressed: register,
                      buttonText: "REGISTER",
                      icon: const Icon(
                        Icons.app_registration,
                        color: Dimensions.deepBlueColor,
                      )),
                ],
              ),
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
}
