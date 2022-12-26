import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymbuddy/controllers/usercontroller.dart';
import 'package:gymbuddy/screens/user/dashboard.dart';
import 'package:gymbuddy/screens/user/register.dart';
import 'package:gymbuddy/utils/dimensions.dart';
import 'package:gymbuddy/utils/page_widget.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final UserController c = Get.put(UserController());

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Dimensions.deepBlueColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: Dimensions.SCREEN_HEIGHT * 0.05,
                ),
                PageWidget.textWidget(
                    textLabel: "Login",
                    fontFamily: 'Montserrat',
                    fontSize: Dimensions.height30,
                    fontWeight: FontWeight.w800,
                    textColor: Dimensions.whiteColor),
                PageWidget.textWidget(
                    textLabel:
                        "Sign in your details or continue \nwith social media",
                    fontFamily: 'Montserrat',
                    fontSize: Dimensions.height15,
                    fontWeight: FontWeight.w700,
                    textColor: Dimensions.whiteColor),
                SizedBox(
                  height: Dimensions.SCREEN_HEIGHT * 0.08,
                ),
                Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: Dimensions.SCREEN_WIDTH * 0.80,
                        child: PageWidget.textFormFieldWidget(
                            valLabel: "User Name",
                            hintText: "User Name...",
                            prefixIcon: Icons.person_add_alt_1_sharp,
                            textInput: TextInputType.name,
                            borderColor: Dimensions.blackColor,
                            fillColor: Dimensions.lightBlue,
                            controller: usernameController,
                            validator: usernameValidator,
                            textColor: Dimensions.deepBlueColor,
                            isObsecure: false),
                      ),
                      SizedBox(
                        height: Dimensions.height15,
                      ),
                      passwordWidget(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height15,
                            horizontal: Dimensions.width25),
                        child: PageWidget.elevatedButton(
                            onPressed: login,
                            buttonText: "SIGN IN",
                            icon: const Icon(Icons.login_outlined,
                                color: Dimensions.deepBlueColor)),
                      ),
                      SizedBox(
                        width: Dimensions.SCREEN_WIDTH * 0.80,
                        child: const Divider(
                          color: Dimensions.lightGreyColor,
                          thickness: 1.0,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PageWidget.socialCard(
                              iconTitle: "assets/icons/google-icon.svg",
                              onPressed: googleSignUp),
                          PageWidget.elevatedButton(
                              onPressed: register,
                              buttonText: "No Account? Sign Up Here",
                              icon: const Icon(
                                Icons.app_registration,
                                color: Dimensions.deepBlueColor,
                              ))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //functions and validators
  Obx passwordWidget() {
    return Obx(
      () => SizedBox(
        width: Dimensions.SCREEN_WIDTH * 0.80,
        child: TextFormField(
          validator: passwordValidator,
          controller: passwordController,
          keyboardType: TextInputType.text,
          obscureText: c.isObsecure.value,
          style: TextStyle(
              fontSize: Dimensions.height20, color: Dimensions.lightGreyColor),
          decoration: InputDecoration(
              labelText: "Password",
              labelStyle: TextStyle(
                  color: Dimensions.deepBlueColor,
                  fontSize: Dimensions.height15),
              prefixIcon: const Icon(
                Icons.lock,
                color: Dimensions.deepBlueColor,
              ),
              suffixIcon: Obx(() => GestureDetector(
                  onTap: () {
                    c.isObsecure.value = !c.isObsecure.value;
                  },
                  child: Icon(
                    c.isObsecure.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Dimensions.lightGreyColor,
                  ))),
              hintText: "Password...",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.height15),
                borderSide: const BorderSide(color: Dimensions.lightGreyColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.height15),
                borderSide: const BorderSide(color: Dimensions.lightGreyColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.height15),
                borderSide: const BorderSide(color: Dimensions.lightGreyColor),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.height15),
                borderSide: const BorderSide(color: Dimensions.lightGreyColor),
              ),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20,
                  vertical: Dimensions.height10),
              fillColor: Dimensions.lightBlue,
              filled: true),
        ),
      ),
    );
  } //password widget

  dynamic usernameValidator(String? value) {
    if (value!.isEmpty) {
      return "User Name is Required";
    } else if (value.length < 3) {
      return "First Name must be up to three(3) characters";
    } else {
      return null;
    }
  } //userNameValidator

  String? passwordValidator(String? value) {
    RegExp passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    if (value!.isEmpty) {
      return "Password is Required";
    } else if (value.length < 8) {
      return "The Password is too short, it must be at least eight(8) characters";
    } else if (!value.contains(RegExp(r'[0-9]'))) {
      return "Password must contain at least one number";
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      return "Password must contain at least one Capital Letter";
    } else if (!value.contains(RegExp(r'[a-z]'))) {
      return "Password must contain at least one Small Letter";
    } else {
      return null;
    }
  } //passwordValidator

  register() {
    debugPrint("Register");
    Get.to(() => Register());
  }

  login() {
    debugPrint("Login");
    Get.to(() => Dashboard());
  }

  googleSignUp() {
    debugPrint("google sign up");
  }
}
