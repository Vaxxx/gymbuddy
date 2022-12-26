import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gymbuddy/utils/dimensions.dart';

class PageWidget {
  static elevatedButton(
      {required Function()? onPressed,
      required String buttonText,
      required Widget icon}) {
    return ElevatedButton.icon(
      onPressed: () => onPressed!(),
      icon: icon,
      label: Text(
        buttonText,
        style: TextStyle(
            color: Dimensions.deepBlueColor, fontSize: Dimensions.height20),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Dimensions.info,
      ),
    );
  }

  static textWidget(
      {required String textLabel,
      required String fontFamily,
      required double fontSize,
      required FontWeight fontWeight,
      required Color textColor}) {
    return Text(
      textLabel,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: fontSize,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          color: textColor),
    );
  }

  static textFormFieldWidget(
      {required String valLabel,
      required String hintText,
      required IconData prefixIcon,
      required Color borderColor,
      required Color fillColor,
      required Color textColor,
      TextInputType? textInput,
      TextEditingController? controller,
      Function(String?)? validator,
      required bool isObsecure}) {
    return TextFormField(
      validator: (String? value) => validator!(value),
      controller: controller,
      obscureText: isObsecure,
      keyboardType: textInput,
      style: TextStyle(fontSize: Dimensions.height20, color: textColor),
      decoration: InputDecoration(
          labelText: hintText,
          labelStyle:
              TextStyle(color: textColor, fontSize: Dimensions.height15),
          prefixIcon: Icon(
            prefixIcon,
            color: textColor,
          ),
          hintText: hintText,
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
              horizontal: Dimensions.width20, vertical: Dimensions.height10),
          fillColor: fillColor,
          filled: true),
    );
  }

  static socialCard(
      {required String iconTitle, required Function()? onPressed}) {
    return GestureDetector(
      onTap: () => onPressed!(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
        padding: EdgeInsets.all(Dimensions.height10),
        height: Dimensions.height40,
        width: Dimensions.width40,
        decoration: const BoxDecoration(
            color: Dimensions.lightGreyColor, shape: BoxShape.circle),
        child: SvgPicture.asset(iconTitle!),
      ),
    );
  }
}
