

import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:solelegant/core/injection/injection.dart';
import 'package:solelegant/core/route/app_router.dart';
import 'package:solelegant/utils/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {
        locator<AppRouter>().pop();
    },
        icon:const Icon(FeatherIcons.chevronLeft,color: ThemeColors.primaryColor,),
splashColor: ThemeColors.primaryColor,
    );
  }
}
