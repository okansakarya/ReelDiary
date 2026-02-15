import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/core/constants/app_colors.dart';

class CustomBackButtonWidget extends StatelessWidget {
  const CustomBackButtonWidget({
    super.key,
  });

  void _navigateToBack(BuildContext context){
   context.pop();
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _navigateToBack(context),
      child:  CircleAvatar(
        radius: 20,
        backgroundColor: AppColors.primary(context),
        child: FaIcon(FontAwesomeIcons.angleLeft,size: 17)
      ),
    );
  }
}