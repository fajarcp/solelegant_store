import 'dart:async';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:solelegant/core/route/app_router.dart';
import 'package:solelegant/core/route/app_router.gr.dart';
import 'package:solelegant/utils/colors.dart';

import '../../../core/injection/injection.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2), () {
      locator<AppRouter>().replace(const HomeTabRoute());

    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      backgroundColor: ThemeColors.primaryColor,
      body:Center(child: Icon(FontAwesomeIcons.fileShield,color: Colors.white,))


    );
  }
}



