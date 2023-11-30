import 'dart:math';

import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:solelegant/ui/screens/home/home_screen.dart';
import 'package:solelegant/utils/colors.dart';


class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.image, required this.name, required this.company, required this.price});
  final String image;
  final String name;
  final String company;
  final double price;
  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  List<Color> selectedColorList=[];
  late String brand;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedColorList=_getRandomColorList();
    brand=vendorList.firstWhere((element) {
      return element.name==widget.company;
    }).image.toString();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: ThemeColors.primaryColor),
        color: Colors.white
        //gradient: LinearGradient(colors: selectedColorList)
      ),
      padding: const EdgeInsets.all(15),
      child: Column(

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.asset(brand)),
               const Icon(FeatherIcons.heart,color: ThemeColors.primaryColor,)

            ],
          ),
          const SizedBox(height: 10,),
          Expanded(
            child: Image.asset(widget.image,fit: BoxFit.cover,),
          ),
          const SizedBox(height: 10,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Expanded(
                child: SizedBox(
                  child: Text(widget.name,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: ThemeColors.primaryColor
                  ),
                  ),
                ),
              ),
          
            ],
          ),
          const SizedBox(height: 2,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Expanded(
                child: SizedBox(
                  child: Text(
                    widget.company,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey
                    ),
                  ),
                ),
              ),
              
            ],
          ),


        ],

      ),
    );
  }



  List<Color> _getRandomColorList() {
    Random random = Random();
    int randomIndex = random.nextInt(ThemeColors.backColorList.length);
    return ThemeColors.backColorList[randomIndex];
  }
}
