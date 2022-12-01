import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Lottie.asset('assets/lottie/sedan.json'),
      // Lottie.network(
      //     'https://assets8.lottiefiles.com/packages/lf20_8NYY2Y.json'),
    );
  }
}