
import 'package:auto_route/auto_route.dart';
import 'package:solelegant/core/route/app_router.gr.dart';
import 'package:solelegant/ui/screens/home/home_screen.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter{

  @override
  final List<AutoRoute> routes = [
  CustomRoute(
  path: '/',
  page: SplashRoute.page,
  initial: true,
  transitionsBuilder: TransitionsBuilders.fadeIn,
  ),
    AutoRoute(
      path: '/${HomeScreen.routeName}',
      page: HomeTabRoute.page,
      children: [
        AutoRoute(path: '', page: HomeRoute.page),
        AutoRoute(path: 'profile', page: ProfileRoute.page),
        AutoRoute(path: 'cart', page: CartRoute.page),
        AutoRoute(path: 'favorite', page: FavoriteRoute.page),
        AutoRoute(path: 'order', page: OrderRoute.page),
      ],
    ),
    AutoRoute(path: '/brand', page: BrandRoute.page),
    AutoRoute(path: '/product-search', page: ProductSearchRoute.page),


  ];


}