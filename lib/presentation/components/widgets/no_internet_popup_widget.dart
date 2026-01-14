import 'package:flutter/material.dart';

class NoInternetPopUpWidget extends StatelessWidget {
  const NoInternetPopUpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.8,
      child: Scaffold(
        body: Align(
          child: Container(
            color: Colors.red,
            padding: const EdgeInsets.all(8),
            child: const Text(
              'No Internet Connection',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}