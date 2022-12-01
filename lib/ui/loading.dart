import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ms_sheet/ui/utils/custom_loading.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  var _size1 = 10.0;
  var _size2 = 5.0;
  var _size3 = 5.0;

  @override
  void initState() {
    // loader
    Timer.periodic(const Duration(milliseconds: 250), (timer) {
      if (mounted) {
        setState(() {
          if (_size1 == 10.0) {
            _size1 = _size1 - 5.0;
            _size2 = _size2 + 5.0;
          } else if (_size2 == 10.0) {
            _size2 = _size2 - 5.0;
            _size3 = _size3 + 5.0;
          } else if (_size3 == 10.0) {
            _size3 = _size3 - 5.0;
            _size1 = _size1 + 5.0;
          }
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      height: media.height * 1,
      width: media.width * 1,
      color: Colors.transparent.withOpacity(0.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width: media.width * 1,
            child: const CustomLoading(),
          )
        ],
      ),
    );
  }
}
