

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:solelegant/utils/colors.dart';

class VendorCard extends StatefulWidget {
  const VendorCard({super.key, required this.image});

final String image;

  @override
  State<VendorCard> createState() => _VendorCardState();
}

class _VendorCardState extends State<VendorCard> {

  List<Color> selectedColorList=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedColorList=_getRandomColorList();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(colors: selectedColorList),
      ),

      child: Center(
        child: SizedBox(
            height: 100,
            width: 150,
            child: Image.asset(widget.image)),
      )
    );
  }



  List<Color> _getRandomColorList() {
    Random random = Random();
    int randomIndex = random.nextInt(ThemeColors.backColorList.length);
    return ThemeColors.backColorList[randomIndex];
  }
}
