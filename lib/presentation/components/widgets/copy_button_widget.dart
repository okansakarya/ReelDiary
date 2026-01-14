import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CopyButtonWidget extends StatelessWidget {
  final String text;

  const CopyButtonWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        FontAwesomeIcons.copy,
      ),
      // FontAwesome copy ikonu
      onPressed: () {
        Clipboard.setData(
          ClipboardData(text: text),
        );
        ScaffoldMessenger.of(context).showSnackBar(

          const SnackBar(content: Text("Metin kopyalandı!"),duration: Duration(milliseconds: 1000),),
        );
      },
    );
  }
}