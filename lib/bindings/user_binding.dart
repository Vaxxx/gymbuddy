import 'package:get/get.dart';
import 'package:gymbuddy/controllers/usercontroller.dart';

class UserBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserController());
  }
}
