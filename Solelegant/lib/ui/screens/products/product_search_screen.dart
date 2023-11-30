import 'package:auto_route/auto_route.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:solelegant/core/injection/injection.dart';
import 'package:solelegant/core/models/product_model.dart';
import 'package:solelegant/core/route/app_router.dart';
import 'package:solelegant/ui/widgets/back_button.dart';
import 'package:solelegant/ui/widgets/product_card.dart';
import 'package:solelegant/utils/colors.dart';
import 'package:solelegant/utils/images.dart';

@RoutePage()
class ProductSearchScreen extends StatefulWidget {
  const ProductSearchScreen({super.key});

  @override
  State<ProductSearchScreen> createState() => _ProductSearchScreenState();
}

class _ProductSearchScreenState extends State<ProductSearchScreen> {
  final TextEditingController searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                            hintText: 'Search products..',
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
                        onFieldSubmitted: (value) {
                          if (searchController.text != "") {


                            //locator<AppRouter>().push(SearchResulRoute(query:searchController.text));

                          }
                          else{

                          }
                        }
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            
            Expanded(
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder: (context, index) {

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductCard(image: productList[index].image,
                        name: productList[index].name, company: productList[index].company, price: productList[index].price,),
                    );

                  },

              ),
            )

          ],
        ),
      ),
    );
  }
}

List<ProductModel> productList=[
  
  ProductModel(name: 'Express', company: 'Nike', image:ImageAssets.nike , price: 2500,imageList: []),
  ProductModel(name: 'Gladiator', company: 'Puma', image:ImageAssets.puma , price: 1500,imageList: []),
  ProductModel(name: 'Stretcher', company: 'New Balance', image:ImageAssets.nb , price: 8000,imageList: []),
  ProductModel(name: 'Sparker X', company: 'Brooks', image:ImageAssets.brooks , price: 2580,imageList: []),
  ProductModel(name: 'Express Runner', company: 'Reebok', image:ImageAssets.reebok , price: 3500,imageList: []),
  ProductModel(name: 'Cool Dust Mazer', company: 'Fila', image:ImageAssets.fila , price: 1500,imageList: []),
  ProductModel(name: 'Addictive Walker', company: 'Adidas', image:ImageAssets.adidas , price: 3500,imageList: []),
  ProductModel(name: 'Hypertone XF', company: 'Skechers', image:ImageAssets.skehers , price: 5600,imageList: []),
  ProductModel(name: 'Flip X Guard XPress', company: 'Crocs', image:ImageAssets.crocs , price: 4500,imageList: []),



];
