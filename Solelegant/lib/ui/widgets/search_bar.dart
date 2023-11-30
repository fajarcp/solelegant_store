

import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:solelegant/core/injection/injection.dart';
import 'package:solelegant/core/route/app_router.dart';
import 'package:solelegant/core/route/app_router.gr.dart';
import 'package:solelegant/utils/colors.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 25,
      onTap: () {
          locator<AppRouter>().push(const ProductSearchRoute());
      },
      splashColor: ThemeColors.primaryColor,
      hoverColor: ThemeColors.primaryColor,
      splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
      child: GlassContainer(
        height: 50,
        borderRadius: BorderRadius.circular(25),
        color: Colors.white30,
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Search..',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white
                ),
                ),
                Icon(FeatherIcons.search,color: Colors.white,)
              ],
            ),
          ),
        )
      ),
    );
  }
}

