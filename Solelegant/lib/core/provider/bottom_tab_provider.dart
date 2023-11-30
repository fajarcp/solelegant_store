import 'package:injectable/injectable.dart';
import 'package:solelegant/utils/bottom_tab_enum.dart';
import 'base/base_provider.dart';

@lazySingleton
class BottomTabProvider extends BaseProvider {
  BottomTabEnum currentTab = BottomTabEnum.home;

  void changeTab(BottomTabEnum newTab) {
    if (newTab == currentTab) {
      return;
    }

    currentTab = newTab;
    notifyListeners();
  }
}
