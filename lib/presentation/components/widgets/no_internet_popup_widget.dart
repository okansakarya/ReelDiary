import 'package:flutter/material.dart';

class NoInternetPopUpWidget extends StatelessWidget {
  const NoInternetPopUpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Opacity(
      opacity: 0.8,
      child: Scaffold(
        body: Align(
          child: Container(
            color: colorScheme.error,
            padding: const EdgeInsets.all(8),
            child: Text(
              'No Internet Connection',
              style: TextStyle(color: colorScheme.onError),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}