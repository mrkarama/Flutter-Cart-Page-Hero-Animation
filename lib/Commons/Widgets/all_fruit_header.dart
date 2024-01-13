import 'package:cart_hero_animation/Commons/Utils/extensions.dart';
import 'package:cart_hero_animation/Commons/Utils/styles.dart';
import 'package:flutter/material.dart';

class AllFruitsHeader extends StatelessWidget {
  const AllFruitsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      height: context.screenHeigth / 12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good Morning!',
                    style: poppinsRegular.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  3.0.verticalSpacer,
                  Text(
                    'Nassirou Bande',
                    style: poppinsMedium.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25,
                  ),
                ),
                child: Image.asset(
                  'assets/images/profile.png',
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
