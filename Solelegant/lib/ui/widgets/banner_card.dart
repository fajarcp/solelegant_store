import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:solelegant/utils/colors.dart';


class BannerCard extends StatelessWidget {
  const BannerCard({super.key, required this.banner, required this.title});
  final String banner;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500
              ),
            ),
            TextButton(onPressed: () {

            },
                child:const Text('View All',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400
                  ),
                )
            )
          ],
        ),
        const SizedBox(height: 8,),

        ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(banner)),
      ],
    );
  }
}
