import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gymbuddy/bindings/user_binding.dart';
import 'package:gymbuddy/screens/add_picture.dart';
import 'package:gymbuddy/screens/home.dart';
import 'package:gymbuddy/screens/location.dart';
import 'package:gymbuddy/screens/post.dart';
import 'package:gymbuddy/screens/settings.dart';
import 'package:gymbuddy/screens/splash.dart';
import 'package:gymbuddy/screens/user/dashboard.dart';
import 'package:gymbuddy/screens/user/login.dart';
import 'package:gymbuddy/screens/user/register.dart';

void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    initialBinding: UserBindings(),
    initialRoute: '/',
    getPages: [
      GetPage(name: '/', page: () => const SplashScreen()),
      GetPage(name: '/homePage', page: () => const HomePage()),
      GetPage(
        name: '/login',
        page: () => Login(),
        binding: UserBindings(),
      ),
      GetPage(
          name: '/register', page: () => Register(), binding: UserBindings()),
      GetPage(
          name: '/dashboard', page: () => Dashboard(), binding: UserBindings()),
      GetPage(name: '/settings', page: () => const Settings()),
      GetPage(name: '/post', page: () => const Post()),
      GetPage(name: '/addLocation', page: () => const AddLocation()),
      GetPage(name: '/addPicture', page: () => const AddPicture()),
    ],
  ));
}
