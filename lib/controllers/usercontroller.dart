import 'package:get/get.dart';

class UserController extends GetxController {
  List<dynamic> errors = [].obs;
  var isLoading = false.obs;
  var isObsecure = true.obs;
  var isObsecureToo = true.obs;

  void addError({String? error}) {
    if (!errors.contains(error)) {
      errors.add(error!);
    }
  } //addError

  void removeError({String? error}) {
    if (errors.contains(error)) {
      errors.remove(error);
    }
  }
}
