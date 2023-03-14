import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import 'color.dart';

class DesignConfig {
  static RoundedRectangleBorder setRoundedBorderCard(
      double radius1, double radius2, double radius3, double radius4) {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(radius1),
            bottomRight: Radius.circular(radius2),
            topLeft: Radius.circular(radius3),
            topRight: Radius.circular(radius4)));
  }

  static Card flatButtonWithIcon(
    Color BgColor,
    double radius,
    IconData icon,
    Color iconColor,
    double iconSize,
    String text,
    double textSize,
    Color textColor,
  ) {
    return Card(
      margin: EdgeInsets.only(left: 2.w),
      color: BgColor,
      elevation: 0,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      child: Padding(
        padding: EdgeInsets.only(top: 0.7.h, bottom: 0.7.h, left: 1.8.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 0.1.w,
            ),
            Icon(
              icon,
              color: iconColor,
              size: iconSize,
            ),
            SizedBox(
              width: 1.0.h,
            ),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: textSize,
              ),
            ),
            SizedBox(
              width: 2.w,
            )
          ],
        ),
      ),
    );
  }

  static Card flatButtonWithCheckBox(
      Color BgColor,
      double radius,
      Color boxColor,
      String text,
      double textSize,
      Color textColor,
      bool check,
      ValueChanged<bool> checkCallback) {
    return Card(
      margin: EdgeInsets.only(left: 2.w),
      color: BgColor,
      elevation: 0,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.3.h, horizontal: 1.8.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 0.1.w,
            ),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: textSize,
              ),
            ),
            Expanded(
              child: SizedBox(
                width: 2.w,
              ),
            ),
            Checkbox(
              value: check,
              onChanged: (value) {
                checkCallback(value!);
              },
              checkColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  static Card flatButton(
    Color BgColor,
    double radius,
    String text,
    double textSize,
    Color textColor,
  ) {
    return Card(
      //margin: EdgeInsets.only(left: 2.w),
      color: BgColor,
      elevation: 0,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.6.h, horizontal: 1.5.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontSize: textSize,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Container inputBoxPassword(
      Color BgColor,
      double radius,
      double fontSize,
      String hint,
      IconData icon,
      double iconSize,
      TextInputType inputType,
      TextEditingController controller) {
    return Container(
      alignment: Alignment.center,
      // height: 9.w,
      child: Card(
        margin: EdgeInsets.only(left: 1.w, right: 1.w, top: 2.w),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        elevation: 0,
        color: BgColor,
        child: Padding(
          padding: EdgeInsets.only(left: 1.w),
          child: TextField(
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            onChanged: (input) {},
            controller: controller,
            keyboardType: inputType,
            style: TextStyle(
                fontSize: fontSize,
                fontFamily: 'Arial',
                fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              isDense: true,
              hintText: hint,
              hintStyle: TextStyle(color: Color.fromARGB(255, 174, 174, 174)),
              border: const OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
      ),
    );
  }

  static Container inputBoxDecorated(
      Color BgColor,
      double radius,
      double fontSize,
      String hint,
      IconData icon,
      double iconSize,
      TextInputType inputType,
      TextEditingController controller) {
    return Container(
      alignment: Alignment.center,
      // height: 9.w,
      child: Card(
        margin: EdgeInsets.only(left: 1.w, right: 1.w, top: 2.w),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        elevation: 0,
        color: BgColor,
        child: Padding(
          padding: EdgeInsets.only(left: 1.w),
          child: TextField(
            onChanged: (input) {},
            controller: controller,
            keyboardType: inputType,
            style: TextStyle(
                fontSize: fontSize,
                fontFamily: 'Arial',
                fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              isDense: true,
              hintText: hint,
              hintStyle: TextStyle(color: Color.fromARGB(255, 174, 174, 174)),
              border: const OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
      ),
    );
  }

  static Container inputBoxDecoratedBordered(
      Color BgColor,
      double radius,
      double fontSize,
      String hint,
      IconData icon,
      double iconSize,
      TextInputType inputType,
      TextEditingController controller,
      Function(String) onClick) {
    return Container(
      alignment: Alignment.center,
      // height: 9.w,
      child: Card(
        margin: EdgeInsets.only(left: 1.w, right: 1.w, top: 2.w),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: BorderSide(width: 0.2, color: ColorsRes.darkGrey)),
        elevation: 0,
        color: BgColor,
        child: Padding(
          padding: EdgeInsets.only(left: 1.w),
          child: TextField(
            textInputAction: TextInputAction.next,
            onChanged: (value) {
              onClick(value);
            },
            style: TextStyle(
                fontSize: fontSize,
                fontFamily: 'Arial',
                fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              isDense: true,
              hintText: hint,
              hintStyle:
                  const TextStyle(color: Color.fromARGB(255, 174, 174, 174)),
              border: const OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
      ),
    );
  }

  static RoundedRectangleBorder setRoundedBorder(
      Color borderColor, double radius, bool isSetSide) {
    return RoundedRectangleBorder(
        side: BorderSide(color: borderColor, width: isSetSide ? 1.0 : 0),
        borderRadius: BorderRadius.circular(radius));
  }

  static RoundedRectangleBorder setRounded(double radius) {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius));
  }

  static RoundedRectangleBorder setHalfRoundedBorder(
      Color borderColor,
      double radius1,
      double radius2,
      double radius3,
      double radius4,
      bool isSetSide) {
    return RoundedRectangleBorder(
        side: BorderSide(color: borderColor, width: isSetSide ? 1.0 : 0),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius1),
            bottomLeft: Radius.circular(radius2),
            topRight: Radius.circular(radius3),
            bottomRight: Radius.circular(radius4)));
  }

  static BoxDecoration boxDecorationContainerRoundHalf(Color color,
      double bradius1, double bradius2, double bradius3, double bradius4) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(bradius1),
          bottomLeft: Radius.circular(bradius2),
          topRight: Radius.circular(bradius3),
          bottomRight: Radius.circular(bradius4)),
    );
  }

  static BoxDecoration boxDecorationContainerShadow(Color color,
      double bradius1, double bradius2, double bradius3, double bradius4) {
    return BoxDecoration(
      color: ColorsRes.white,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(bradius1),
          bottomLeft: Radius.circular(bradius2),
          topRight: Radius.circular(bradius3),
          bottomRight: Radius.circular(bradius4)),
      boxShadow: [
        BoxShadow(
            color: color,
            offset: const Offset(0.0, 2.0),
            blurRadius: 6.0,
            spreadRadius: 0)
      ],
    );
  }

  static BoxDecoration boxDecorationContainer(Color color, double radius) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
    );
  }

  static OutlineInputBorder outlineInputBorder(Color color, double radius) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: color, width: 1),
    );
  }

  static BoxDecoration boxDecorationContainerHalf(Color color) {
    return BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(0.0),
          bottomLeft: Radius.circular(0.0),
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0)),
    );
  }

  static BoxDecoration boxDecorationContainerBorder(
      Color color, Color colorBackground, double radius) {
    return BoxDecoration(
      color: colorBackground,
      border: Border.all(color: color),
      borderRadius: BorderRadius.circular(radius),
    );
  }

  static BoxDecoration boxDecorationContainerBorderCustom(
      Color color, Color colorBackground, double radius) {
    return BoxDecoration(
      color: colorBackground,
      border: Border.all(color: color, width: 0.5),
      borderRadius: BorderRadius.circular(radius),
    );
  }

  static BoxDecoration boxDecorationCircle(
      Color color, Color colorBackground, double radius) {
    return BoxDecoration(
      color: colorBackground,
      border: Border.all(color: color, width: 2.0),
      borderRadius: BorderRadius.circular(radius),
    );
  }

  static BoxDecoration circle(Color color) {
    return BoxDecoration(shape: BoxShape.circle, color: color);
  }

  static setSvgPath(String name) {
    return "assets/icons/$name.svg";
  }

  static setPngPath(String name) {
    return "assets/images/image/4.0x/$name.png";
  }

  static setLottiePath(String name) {
    return "assets/images/json/$name.json";
  }

  static BoxDecoration boxCurveShadow(Color? color) {
    return BoxDecoration(
        color: color!,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
        boxShadow: const [
          BoxShadow(
            color: ColorsRes.shadow,
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, -9),
          )
        ]);
  }

  static BoxDecoration boxCurveBottomBarShadow() {
    return const BoxDecoration(
        color: ColorsRes.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorsRes.shadowBottomBar,
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, -5),
          )
        ]);
  }

  static BoxDecoration boxDecorationContainerCardShadow(
      Color color,
      Color shadowColor,
      double radius,
      double x,
      double y,
      double b,
      double s) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [
        BoxShadow(
            color: shadowColor,
            offset: Offset(x, y),
            blurRadius: b,
            spreadRadius: s),
      ],
    );
  }

  static BoxDecoration boxDecorationContainerShadow1() {
    return const BoxDecoration(
      color: ColorsRes.white,
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
            color: Color(0x0f292929),
            offset: Offset(0.0, 6.0),
            blurRadius: 10.0,
            spreadRadius: 0)
      ],
    );
  }

  static InputDecoration inputDecorationextField(
      String lableText, String hintText, double width) {
    return InputDecoration(
      labelText: lableText,
      border: InputBorder.none,
      hintText: hintText,
      labelStyle: const TextStyle(
        color: ColorsRes.darkBlackBoarderTextColor,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
      ),
      hintStyle: const TextStyle(
        color: ColorsRes.darkBlackBoarderTextColor,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
      ),
      contentPadding: EdgeInsetsDirectional.only(start: width / 20.0),
      enabledBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(width: 1.0, color: ColorsRes.darkBlackBoarderTextColor),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 1.0, color: ColorsRes.red),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 1.0, color: ColorsRes.red),
      ),
      disabledBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(width: 1.0, color: ColorsRes.darkBlackBoarderTextColor),
      ),
    );
  }

  static imageWidgets(
      String? image, double? height, double? width, String? imageStatus) {
    return (image != "" /*&& image!.isNotEmpty*/)
        ? FadeInImage(
            placeholder: AssetImage(
              DesignConfig.setPngPath('placeholder_square'),
            ),
            image: (imageStatus == "1")
                ? AssetImage(
                    DesignConfig.setPngPath(image!),
                  )
                : NetworkImage(
                    image!,
                  ) as ImageProvider,
            imageErrorBuilder: (context, error, stackTrace) {
              return Image.asset(
                DesignConfig.setPngPath('placeholder_square'),
                height: height,
                width: width,
                fit: BoxFit.cover,
              );
            },
            placeholderErrorBuilder: (context, error, stackTrace) {
              return Image.asset(
                DesignConfig.setPngPath('placeholder_square'),
                height: height,
                width: width,
                fit: BoxFit.cover,
              );
            },
            height: height!,
            width: width!,
            fit: BoxFit.cover,
          )
        : Image.asset(
            DesignConfig.setPngPath('placeholder_square'),
            height: height!,
            width: width!,
            fit: BoxFit.cover,
          );
  }

  static appBar(BuildContext context, double? width, String? text, bottom) {
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
              padding: EdgeInsetsDirectional.only(start: width! / 20),
              child: SvgPicture.asset(
                DesignConfig.setSvgPath("back_icon"),
                width: 32,
                height: 32,
                fit: BoxFit.scaleDown,
              ))),
      backgroundColor: ColorsRes.white,
      shadowColor: ColorsRes.white,
      elevation: 0,
      centerTitle: true,
      title: Text(text!,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: ColorsRes.backgroundDark,
              fontSize: 18,
              fontWeight: FontWeight.w500)),
      bottom: bottom,
    );
  }

  static appBarWihoutBackbutton(
      BuildContext context, double? width, String? text, bottom) {
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      backgroundColor: ColorsRes.white,
      shadowColor: ColorsRes.white,
      elevation: 0,
      centerTitle: true,
      title: Text(text!,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: ColorsRes.backgroundDark,
              fontSize: 18,
              fontWeight: FontWeight.w500)),
      bottom: bottom,
    );
  }

  static Divider divider() {
    return Divider(
        color: ColorsRes.lightFont.withOpacity(0.85),
        height: 0.2,
        thickness: 0.2);
  }
}
