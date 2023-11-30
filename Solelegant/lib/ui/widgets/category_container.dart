import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:solelegant/utils/colors.dart';

class CategoryView extends StatelessWidget {
  CategoryView({super.key, required this.categoryName});

  final String categoryName;
  ValueNotifier<bool> isSelected = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isSelected,
      builder: (BuildContext context, bool value, Widget? child) {
        return GlassContainer(
          width: 100,
          borderRadius: BorderRadius.circular(20),
          color: ThemeColors.primaryColor,
          border: value ? Border.all(color: Colors.white) : null,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Center(
              child: Text(categoryName,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14
                ),
              ),
            ),
          ),


        );

      },

    );
  }

  void selected() {
    isSelected.value = true;
  }
}
