

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:provider/provider.dart';
import 'package:solelegant/core/injection/injection.dart';
import 'package:solelegant/core/provider/bottom_tab_provider.dart';
import 'package:solelegant/core/route/app_router.dart';
import 'package:solelegant/core/route/app_router.gr.dart';
import 'package:solelegant/utils/bottom_tab_enum.dart';
import 'package:solelegant/utils/colors.dart';

@RoutePage()
class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Expanded(
              child: AutoRouter(),
            ),
            Positioned(
                bottom: 25,
                left: 15,
                right: 15,
                child: _BottomNavigationBar()),
          ],
        ),
      ),
    );
  }
}

class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      borderRadius: BorderRadius.circular(40),
      color: Colors.white.withOpacity(0.6),
      border: Border.all(color: ThemeColors.primaryColor),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            BottomTabEnum.values.length,
                (index) => _BottomTabButton(bottomTabEnum: BottomTabEnum.values[index]),
          ),
        ),
      ),
    );
  }
}
class _BottomTabButton extends StatefulWidget {
  const _BottomTabButton({
    required this.bottomTabEnum,
  });

  final BottomTabEnum bottomTabEnum;

  @override
  State<_BottomTabButton> createState() => _BottomTabButtonState();
}

class _BottomTabButtonState extends State<_BottomTabButton> {
  @override
  void initState() {
    super.initState();
    if (locator<AppRouter>().childControllers.isNotEmpty) {
      locator<AppRouter>().childControllers.first.addListener(_findCurrentActiveTab);
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (locator<AppRouter>().childControllers.isNotEmpty) {
      locator<AppRouter>().childControllers.first.removeListener(_findCurrentActiveTab);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;

    return Consumer<BottomTabProvider>(
      builder: (context, provider, child) {
        return Center(
          child: InkWell(
            onTap: () => _onTapTab(context),
            child: Column(
              children: [
                SizedBox(
                  child: CircleAvatar(

                    radius: 20,
                    backgroundColor:  provider.currentTab==widget.bottomTabEnum?ThemeColors.primaryColor:Colors.transparent
                    ,
                    child: Center(
                      child: Icon(
                        widget.bottomTabEnum.icon,
                        size: 20,
                          color: provider.currentTab==widget.bottomTabEnum?Colors.white:ThemeColors.primaryColor,



                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }

  void _findCurrentActiveTab() {
    if (locator<AppRouter>().childControllers.isEmpty) {
      return;
    }

    bool flag = false;
    for (final route in locator<AppRouter>().childControllers.first.stack.reversed) {
      switch (route.name) {
        case HomeRoute.name:
          locator<BottomTabProvider>().changeTab(BottomTabEnum.home);
          flag = true;
          break;
        case FavoriteRoute.name:
          locator<BottomTabProvider>().changeTab(BottomTabEnum.favorite);
          flag = true;
          break;
        case CartRoute.name:
          locator<BottomTabProvider>().changeTab(BottomTabEnum.cart);
          flag = true;
          break;
        case ProfileRoute.name:
          locator<BottomTabProvider>().changeTab(BottomTabEnum.profile);
          flag = true;
          break;
        case OrderRoute.name:
          locator<BottomTabProvider>().changeTab(BottomTabEnum.order);
          flag = true;
          break;
      }
      if (flag) {
        break;
      }
    }
  }

  void _onTapTab(BuildContext context) {
    switch (widget.bottomTabEnum) {
      case BottomTabEnum.home:
        context.navigateTo(const HomeRoute());
        break;
      case BottomTabEnum.favorite:
        context.navigateTo(const FavoriteRoute());
        break;
      case BottomTabEnum.order:
        context.navigateTo(const OrderRoute());
        break;
      case BottomTabEnum.profile:
        context.navigateTo(const ProfileRoute());
        break;
      case BottomTabEnum.cart:
        context.navigateTo(const CartRoute());
        break;
    }
  }
}




