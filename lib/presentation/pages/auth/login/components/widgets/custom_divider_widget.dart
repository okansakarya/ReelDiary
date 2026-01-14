import 'package:flutter/material.dart';
import 'package:movieapp/utils/screen_utils.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtils.getScreenWidth(context) * 0.03,
          ),
          child: Text(
            'veya',
            style: TextStyle(
              /// app colorsa geicek
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
