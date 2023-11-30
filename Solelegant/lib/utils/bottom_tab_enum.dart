import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

enum BottomTabEnum {
  home(icon: FeatherIcons.home),
  favorite(icon: FeatherIcons.heart),
  order(icon: FeatherIcons.package),
  cart(icon: FeatherIcons.shoppingBag),
  profile(icon: FeatherIcons.user);

  const BottomTabEnum({
    required this.icon,
  });

  final IconData icon;
}