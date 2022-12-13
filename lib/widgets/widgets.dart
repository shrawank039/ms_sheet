import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../ui/styles/styles.dart';

//button style

// ignore: must_be_immutable
class Button extends StatefulWidget {
  dynamic onTap;
  final String text;
  dynamic color;
  dynamic borcolor;
  dynamic textcolor;
  dynamic width;

  // ignore: use_key_in_widget_constructors
  Button(
      {required this.onTap,
      required this.text,
      this.color,
      this.borcolor,
      this.textcolor,
      this.width});

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: media.width * 0.1,
        width: (widget.width != null) ? widget.width : null,
        padding: EdgeInsets.only(
            left: media.width * twenty, right: media.width * twenty),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: (widget.color != null) ? widget.color : buttonColor,
            border: Border.all(
              color: (widget.borcolor != null) ? widget.borcolor : buttonColor,
              width: 1,
            )),
        alignment: Alignment.center,
        child: Text(
          widget.text,
          style: GoogleFonts.lato(
              fontSize: 11.sp,
              color: (widget.textcolor != null) ? widget.textcolor : buttonText,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
      ),
    );
  }
}

//input field style

// ignore: must_be_immutable
class InputField extends StatefulWidget {
  dynamic icon;
  dynamic onTap;
  final String text;
  final TextEditingController textController;
  dynamic inputType;
  dynamic maxLength;
  dynamic color;

  // ignore: use_key_in_widget_constructors
  InputField(
      {this.icon,
      this.onTap,
      required this.text,
      required this.textController,
      this.inputType,
      this.maxLength,
      this.color});

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return TextFormField(
      maxLength: (widget.maxLength == null) ? null : widget.maxLength,
      keyboardType: (widget.inputType == null)
          ? TextInputType.emailAddress
          : widget.inputType,
      controller: widget.textController,
      decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: Colors.grey[200],
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
          prefixIcon: (widget.icon != null)
              ? Icon(
                  widget.icon,
                  size: media.width * 0.064,
                  color: textColor,
                )
              : null,
          prefixIconColor: Colors.grey[200],
          hintText: widget.text,
          hintStyle: GoogleFonts.lato(
            fontSize: media.width * sixteen,
            color: hintColor,
          )),
      onChanged: widget.onTap,
    );
  }
}

class InputFieldNumber extends StatefulWidget {
  dynamic icon;
  dynamic onTap;
  final String text;
  final TextEditingController textController;
  dynamic inputType;
  dynamic maxLength;
  dynamic color;

  // ignore: use_key_in_widget_constructors
  InputFieldNumber(
      {this.icon,
      this.onTap,
      required this.text,
      required this.textController,
      this.inputType,
      this.maxLength,
      this.color});

  @override
  _InputFieldNumberState createState() => _InputFieldNumberState();
}

class _InputFieldNumberState extends State<InputFieldNumber> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return TextFormField(
      maxLength: (widget.maxLength == null) ? null : widget.maxLength,
      keyboardType: (widget.inputType == null)
          ? TextInputType.emailAddress
          : widget.inputType,
      controller: widget.textController,
      decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: Colors.grey[200],
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
          prefixIcon: (widget.icon != null)
              ? Icon(
                  widget.icon,
                  size: media.width * 0.064,
                  color: textColor,
                )
              : null,
          prefixIconColor: Colors.grey[200],
          hintText: widget.text,
          contentPadding:
              EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          hintStyle: GoogleFonts.lato(
            fontSize: media.width * fourteen,
            color: hintColor,
          )),
      style: TextStyle(
        fontSize: media.width * eighteen,
      ),
      onChanged: widget.onTap,
    );
  }
}
