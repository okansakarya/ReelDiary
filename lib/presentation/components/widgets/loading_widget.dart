import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SpinKitThreeInOut(
      color: Color(0xFFFF6F61),
      size: 20,
      duration: Duration(milliseconds: 1000),
    );
  }
}
