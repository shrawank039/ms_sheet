import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowToast extends StatelessWidget {
  String message;
  BuildContext context;
  ShowToast(this.message, this.context, {Key? key}) : super(key: key);

  late FToast fToast;

  showToast(String text) {
    fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.CENTER,
      toastDuration: Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return showToast(message);
  }
}
