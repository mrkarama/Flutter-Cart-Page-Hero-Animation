import 'package:cart_hero_animation/Commons/Models/fruit_model.dart';
import 'package:cart_hero_animation/Commons/Utils/extensions.dart';
import 'package:cart_hero_animation/Commons/Utils/styles.dart';
import 'package:cart_hero_animation/Commons/Widgets/square_container.dart';
import 'package:cart_hero_animation/Providers/all_fruits_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FruitDetailsPage extends StatelessWidget {
  final FruitModel fruitModel;
  const FruitDetailsPage({
    super.key,
    required this.fruitModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () {
          context.read<AllFruitsProvider>().addToCart(
                fruitModel,
              );
          Navigator.pop(context);
        },
        child: Container(
          width: context.screenWidth,
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 20,
          ),
          height: 55,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
          child: Center(
            child: Text(
              'Add to Cart',
              style: poppinsMedium.copyWith(
                fontSize: 19,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: context.screenHeigth / 2.45,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                    ),
                  ),
                  Text(
                    fruitModel.category,
                    style: poppinsMedium.copyWith(
                      fontSize: 21,
                    ),
                  ),
                  const SquareContainer(
                    widthAndHeight: 30,
                  ),
                ],
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: SizedBox(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: context.screenHeigth / 2.6,
                        color: Colors.grey.shade300,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                          ),
                          child: Center(
                            child: Hero(
                              tag: fruitModel.id,
                              flightShuttleBuilder: (
                                flightContext,
                                animation,
                                flightDirection,
                                fromHeroContext,
                                toHeroContext,
                              ) {
                                switch (flightDirection) {
                                  // ignore: constant_pattern_never_matches_value_type
                                  case HeroFlightDirection.push:
                                    return toHeroContext.widget;
                                  // ignore: constant_pattern_never_matches_value_type
                                  case HeroFlightDirection.pop:
                                    return fromHeroContext.widget;
                                }
                              },
                              child: Image.asset(
                                fruitModel.url,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -20,
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: 115,
                            height: 60,
                            padding: const EdgeInsets.only(
                              bottom: 18,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(
                                  60,
                                ),
                                bottomRight: Radius.circular(
                                  60,
                                ),
                              ),
                            ),
                            child: Consumer<AllFruitsProvider>(
                              builder: (context, value, child) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        context
                                            .read<AllFruitsProvider>()
                                            .setQantity(
                                              false,
                                            );
                                      },
                                      child: SquareContainer(
                                        isAddOrRemoveButton: true,
                                        widthAndHeight: 35,
                                        child: Icon(
                                          Icons.remove,
                                          color: context.disabledColor,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      value.quantity.toString(),
                                      style: poppinsBold.copyWith(
                                        fontSize: 17,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        context
                                            .read<AllFruitsProvider>()
                                            .setQantity(
                                              true,
                                            );
                                      },
                                      child: SquareContainer(
                                        isAddOrRemoveButton: true,
                                        widthAndHeight: 35,
                                        child: Icon(
                                          Icons.add,
                                          color: context.disabledColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 30,
                  bottom: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fruitModel.name,
                      style: poppinsBold.copyWith(
                        fontSize: 21,
                      ),
                    ),
                    20.0.verticalSpacer,
                    SizedBox(
                      width: context.screenWidth,
                      child: Text(
                        fruitModel.description,
                        maxLines: 11,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        style: poppinsRegular.copyWith(
                          fontSize: 17,
                          color: context.disabledColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
