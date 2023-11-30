import 'package:auto_route/auto_route.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:solelegant/core/models/vendor_model.dart';
import 'package:solelegant/ui/screens/home/home_screen.dart';
import 'package:solelegant/ui/widgets/back_button.dart';
import 'package:solelegant/ui/widgets/vendor_card.dart';
import 'package:solelegant/utils/colors.dart';

@RoutePage()
class BrandScreen extends StatefulWidget {
  const BrandScreen({super.key});

  @override
  State<BrandScreen> createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen> {
  final TextEditingController searchController=TextEditingController();
  List<VendorModel> finalResultList=[];
  ValueNotifier<List<VendorModel>> searchChangedNotifier=ValueNotifier(vendorList);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
             Padding(
               padding: const EdgeInsets.all(15),
               child: Row(
                 children: [
                   const CustomBackButton(),
                   const SizedBox(width: 10,),
                   Expanded(
                     child: TextFormField(
                       style: const TextStyle(
                         color: ThemeColors.primaryColor
                       ),
                       controller: searchController,
                       decoration: InputDecoration(

                         //suffixIconColor: ThemeColors.primaryColor,
                         //suffixIcon: const Icon(FeatherIcons.search),
                         filled: true,
                         fillColor: Colors.white.withOpacity(0.1),
                         hintText: 'Search brands..',
                         hintStyle: const TextStyle(
                           color: ThemeColors.primaryColor
                         ),
                         enabledBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(20),
                           borderSide: const BorderSide(color: ThemeColors.primaryColor,width: 1)
                         ),
                           focusedBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(20),
                               borderSide: const BorderSide(color: ThemeColors.primaryColor,width: 1)
                           ),
                         border: InputBorder.none
                       ),
                       onChanged: (value) {
                         if(searchController.text!=""){
                           finalResultList = vendorList.where((element) {
                             // Check if the element and its name property are not null
                             return  element.name.toLowerCase().contains(searchController.text.toLowerCase());
                           }).toList();
                           searchChangedNotifier.value=finalResultList;
                         }
                         else{
                           searchChangedNotifier.value=vendorList;
                         }

                       },
                     ),
                   ),
                 ],
               ),
             ),
            ValueListenableBuilder(
              valueListenable: searchChangedNotifier,
              builder: (context, value, child) {
               return Expanded(
                 child: GridView.builder(
                   physics: const BouncingScrollPhysics(),
                   itemCount: searchChangedNotifier.value.length,
                   shrinkWrap: true,
                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,

                   ),
                   itemBuilder: (context, index) {
                     return Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: VendorCard(image: searchChangedNotifier.value[index].image),
                     );
                   },

                 ),
               );
              },

            )

          ],
        ),
      ),
    );
  }
}
