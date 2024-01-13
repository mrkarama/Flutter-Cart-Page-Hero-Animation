import 'package:cart_hero_animation/Commons/Models/fruit_model.dart';
import 'package:cart_hero_animation/Commons/Utils/styles.dart';
import 'package:cart_hero_animation/Commons/Widgets/square_container.dart';
import 'package:flutter/material.dart';

extension BuildContextExtenions on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;

  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeigth => MediaQuery.of(this).size.height;

  Color get disabledColor => Theme.of(this).disabledColor;
}

extension WidgetExtensions on double {
  Widget get horizontalSpacer => SizedBox(
        width: this,
      );

  Widget get verticalSpacer => SizedBox(
        height: this,
      );
}

extension FruitExtension on FruitModel {
  Widget toGridViewTile(BuildContext context) => Container(
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            15,
          ),
          color: Colors.grey.shade300,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: id,
              child: Image.asset(
                url,
                height: context.screenHeigth / 5,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: poppinsMedium.copyWith(
                      fontSize: 19,
                    ),
                  ),
                  Text(
                    category,
                    style: poppinsRegular.copyWith(
                      fontSize: 13,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: '\$',
                            style: poppinsBlack.copyWith(
                              fontSize: 17,
                              color: Colors.green,
                            ),
                            children: [
                              TextSpan(
                                text: price.toString(),
                                style: poppinsBlack.copyWith(
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: '/kg',
                                    style: poppinsRegular.copyWith(
                                      fontSize: 15,
                                      color: context.disabledColor,
                                    ),
                                  )
                                ],
                              )
                            ]),
                      ),
                      const SquareContainer(
                        widthAndHeight: 30,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
}
