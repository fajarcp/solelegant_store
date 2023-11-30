
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:solelegant/core/provider/bottom_tab_provider.dart';

import '../../injection/injection.dart';

abstract class MultiProviders{
  static final List<SingleChildWidget> providers = [
    ChangeNotifierProvider(
      create: (_) => locator<BottomTabProvider>(),
    ),



  ];
}