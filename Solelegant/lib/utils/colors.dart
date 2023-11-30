

import 'package:flutter/material.dart';

abstract class ThemeColors{

  static const Color primaryColor = Colors.blueGrey;


  static const List<List<Color>> backColorList=[
    [Colors.red,Colors.orange],
    [Colors.lightBlueAccent,Colors.blueAccent],
    [Colors.green,Colors.yellow],
    [ThemeColors.primaryColor,Colors.black12]

    ];


}