import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymbuddy/controllers/usercontroller.dart';
import 'package:gymbuddy/screens/user/login.dart';
import 'package:gymbuddy/utils/dimensions.dart';
import 'package:gymbuddy/utils/page_widget.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final UserController c = Get.put(UserController());

  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Dimensions.deepBlueColor,
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Dimensions.SCREEN_HEIGHT * 0.04,
                ),
                PageWidget.textWidget(
                    textLabel: "Register",
                    fontFamily: 'Montserrat',
                    fontSize: Dimensions.height30,
                    fontWeight: FontWeight.w800,
                    textColor: Dimensions.whiteColor),
                PageWidget.textWidget(
                    textLabel:
                        "Complete your details or continue \nwith social media",
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
                      //row of firstname and lastname
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: Dimensions.SCREEN_WIDTH * 0.45,
                            child: PageWidget.textFormFieldWidget(
                                valLabel: "First Name",
                                hintText: "First Name...",
                                prefixIcon: Icons.person,
                                textInput: TextInputType.name,
                                borderColor: Dimensions.blackColor,
                                controller: firstnameController,
                                validator: firstnameValidator,
                                fillColor: Dimensions.lightBlue,
                                textColor: Dimensions.deepBlueColor,
                                isObsecure: false),
                          ),
                          SizedBox(
                            width: Dimensions.SCREEN_WIDTH * 0.45,
                            child: PageWidget.textFormFieldWidget(
                                valLabel: "Last Name",
                                hintText: "Last Name...",
                                prefixIcon: Icons.person,
                                borderColor: Dimensions.blackColor,
                                controller: lastnameController,
                                validator: lastnameValidator,
                                textInput: TextInputType.name,
                                fillColor: Dimensions.lightBlue,
                                textColor: Dimensions.deepBlueColor,
                                isObsecure: false),
                          )
                        ],
                      ),
                      //row of username and phone
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: Dimensions.SCREEN_WIDTH * 0.45,
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
                            width: Dimensions.SCREEN_WIDTH * 0.45,
                            child: PageWidget.textFormFieldWidget(
                                valLabel: "Phone Number",
                                hintText: "Phone...",
                                prefixIcon: Icons.phone,
                                textInput: TextInputType.phone,
                                borderColor: Dimensions.blackColor,
                                fillColor: Dimensions.lightBlue,
                                controller: phoneController,
                                validator: phoneValidator,
                                textColor: Dimensions.deepBlueColor,
                                isObsecure: false),
                          )
                        ],
                      ),
                      //row of email and age
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: Dimensions.SCREEN_WIDTH * 0.45,
                            child: PageWidget.textFormFieldWidget(
                                valLabel: "Email Address",
                                hintText: "Email...",
                                prefixIcon: Icons.email,
                                textInput: TextInputType.emailAddress,
                                borderColor: Dimensions.blackColor,
                                fillColor: Dimensions.lightBlue,
                                controller: emailController,
                                validator: emailValidator,
                                textColor: Dimensions.deepBlueColor,
                                isObsecure: false),
                          ),
                          SizedBox(
                            width: Dimensions.SCREEN_WIDTH * 0.45,
                            child: PageWidget.textFormFieldWidget(
                                valLabel: "Age",
                                hintText: "Age...",
                                prefixIcon: Icons.numbers_outlined,
                                borderColor: Dimensions.blackColor,
                                textInput: TextInputType.number,
                                fillColor: Dimensions.lightBlue,
                                controller: ageController,
                                validator: ageValidator,
                                textColor: Dimensions.deepBlueColor,
                                isObsecure: false),
                          )
                        ],
                      ),
                      //row of password and confirm password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: Dimensions.SCREEN_WIDTH * 0.45,
                            child: passwordWidget(),
                          ),
                          SizedBox(
                            width: Dimensions.SCREEN_WIDTH * 0.45,
                            child: confirmPasswordWidget(),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height10,
                            horizontal: Dimensions.width25),
                        child: PageWidget.elevatedButton(
                            onPressed: register,
                            buttonText: "SIGN UP",
                            icon: const Icon(Icons.app_registration_sharp,
                                color: Dimensions.deepBlueColor)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: Dimensions.SCREEN_HEIGHT * 0.08,
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
                        onPressed: login,
                        buttonText: "Sign in",
                        icon: const Icon(
                          Icons.person_outline,
                          color: Dimensions.deepBlueColor,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  ////validation
  Obx confirmPasswordWidget() {
    return Obx(
      () => SizedBox(
        width: Dimensions.SCREEN_WIDTH * 0.45,
        child: TextFormField(
          validator: passwordValidator,
          controller: confirmPasswordController,
          obscureText: c.isObsecureToo.value,
          keyboardType: TextInputType.text,
          style: TextStyle(
              fontSize: Dimensions.height20, color: Dimensions.lightGreyColor),
          decoration: InputDecoration(
              labelText: "Confirm Password",
              labelStyle: TextStyle(
                  color: Dimensions.lightGreyColor,
                  fontSize: Dimensions.height15),
              prefixIcon: const Icon(
                Icons.lock_outline_rounded,
                color: Dimensions.deepBlueColor,
              ),
              suffixIcon: Obx(() => GestureDetector(
                  onTap: () {
                    c.isObsecureToo.value = !c.isObsecureToo.value;
                  },
                  child: Icon(
                    c.isObsecureToo.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Dimensions.deepBlueColor,
                  ))),
              hintText: "Confirm Password...",
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
  } //confirmPasswordWidget

  Obx passwordWidget() {
    return Obx(
      () => SizedBox(
        width: Dimensions.SCREEN_WIDTH * 0.45,
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
  } //passwordWidget

  dynamic firstnameValidator(String? value) {
    if (value!.isEmpty) {
      return "First Name is Required";
    } else if (value.length < 2) {
      return "First Name must be up to two(2) characters";
    } else {
      return null;
    }
  } //firstNameValidator

  dynamic lastnameValidator(String? value) {
    if (value!.isEmpty) {
      return "Last Name is Required";
    } else if (value.length < 2) {
      return "last Name must be up to two(2) characters";
    } else {
      return null;
    }
  } //lastNameValidator

  dynamic usernameValidator(String? value) {
    if (value!.isEmpty) {
      return "User Name is Required";
    } else if (value.length < 3) {
      return "First Name must be up to three(3) characters";
    } else {
      return null;
    }
  } //userNameValidator

  dynamic emailValidator(String? value) {
    RegExp emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value!.isEmpty) {
      return 'Email Address value is required';
    } else if (value.length < 4) {
      return "Email Address value is too short";
    } else if (!emailRegExp.hasMatch(value)) {
      return "Invalid Email Address format";
    } else {
      return null;
    }
  } //emailValidator

  dynamic ageValidator(String? value) {
    if (value!.isEmpty) {
      return "Age Value is Required";
    } else if (value.length > 3) {
      return "Anyone above a 100 years is not allowed to register";
    } else {
      return null;
    }
  } //ageValidator

  dynamic phoneValidator(String? value) {
    if (value!.isEmpty) {
      return "Phone Value is Required";
    } else if (value.length > 9) {
      return "Phone Number is not complete";
    } else if (!value.isNum) {
      return "Phone Number has invalid";
    } else {
      return null;
    }
  } //ageValidator

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
  }

  login() {
    debugPrint("Login");
    Get.to(() => Login());
  }

  googleSignUp() {
    debugPrint("google sign up");
  }
}
