import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:solelegant/core/injection/injection.dart';
import 'package:solelegant/core/models/product_model.dart';
import 'package:solelegant/core/models/vendor_model.dart';
import 'package:solelegant/core/route/app_router.dart';
import 'package:solelegant/core/route/app_router.gr.dart';
import 'package:solelegant/ui/widgets/banner_card.dart';
import 'package:solelegant/ui/widgets/category_container.dart';
import 'package:solelegant/ui/widgets/product_container.dart';
import 'package:solelegant/ui/widgets/vendor_card.dart';
import 'package:solelegant/utils/colors.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solelegant/utils/images.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:solelegant/ui/widgets/search_bar.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ScrollController vendorScrollController=ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const Drawer(
          child: Text('hello welcome'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
              child: Container(
                  padding: const EdgeInsets.only(
                      top: 30, left: 20, right: 20, bottom: 20),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25)),

                      color: ThemeColors.primaryColor, ),
                      //Color(0xFFC2F0FF)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Builder(builder: (BuildContext context) {
                            return IconButton(
                                style: const ButtonStyle(
                                    splashFactory: InkSparkle
                                        .constantTurbulenceSeedSplashFactory),
                                hoverColor: Colors.cyan,
                                onPressed: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                icon: const Icon(FeatherIcons.menu,color: Colors.white,));
                          }),
                          const Icon(
                            FontAwesomeIcons.accusoft,
                            size: 40,
                            color: Colors.white,
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.white)),
                            child: SvgPicture.asset(
                              ImageAssets.profileImage,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      const CustomSearch()
                    ],
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: SizedBox(
                height: 50,
                child: ListView.builder(
                  physics: const PageScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: categoryList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: CategoryView(categoryName: categoryList[index]),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),

                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Popular Brands',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                          ),
                          ),
                          TextButton(onPressed: () {
                               locator<AppRouter>().push(const BrandRoute());
                          },
                              child:const Text('View All',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400
                                ),
                              )
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 8,),
                    Padding(
                      padding: const EdgeInsets.only(left: 8,right: 8),
                      child: SizedBox(
                        height: 150,
                        child: ListView.builder(
                          controller: vendorScrollController,
                          physics: const PageScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: vendorList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: VendorCard(image: vendorList[index].image)
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: BannerCard(banner: ImageAssets.sports,title:'Sportswear'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: BannerCard(banner: ImageAssets.ladies,title: 'Ladies Trends',),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: BannerCard(banner: ImageAssets.formal,title: 'Formal Wears',),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: BannerCard(banner: ImageAssets.kids,title: 'Kids Fashion',),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: BannerCard(banner: ImageAssets.casual,title: 'Casual Looks',),
                    )


                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,)

          ],
        ),
      ),
    );
  }
}

List<String> categoryList = [
  'All',
  'Running',
  'Sneakers',
  'Sandals',
  'Soccer',
  'Sneakers',
  'Sandals',
  'Soccer',
];
List<VendorModel> vendorList = [
VendorModel(image: ImageAssets.vendor1, name: 'Brooks'),
  VendorModel(image: ImageAssets.vendor2, name: 'Adidas'),
  VendorModel(image: ImageAssets.vendor3, name: 'Skechers'),
  VendorModel(image: ImageAssets.vendor4, name: 'Puma'),
  VendorModel(image: ImageAssets.vendor5, name: 'New Balance'),
  VendorModel(image: ImageAssets.vendor6, name: 'Nike'),
  VendorModel(image: ImageAssets.vendor7, name: 'Crocs'),
  VendorModel(image: ImageAssets.vendor8, name: 'Fila'),
  VendorModel(image: ImageAssets.vendor9, name: 'Reebok'),


];
