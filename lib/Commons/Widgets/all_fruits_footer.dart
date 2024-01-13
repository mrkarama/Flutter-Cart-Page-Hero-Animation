import 'package:cart_hero_animation/Commons/Models/fruit_model.dart';
import 'package:cart_hero_animation/Commons/Utils/extensions.dart';
import 'package:cart_hero_animation/Commons/Utils/styles.dart';
import 'package:cart_hero_animation/Providers/all_fruits_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllFruitsFooter extends StatelessWidget {
  const AllFruitsFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AllFruitsProvider>(builder: (context, value, child) {
      List<FruitModel> data = [];
      value.items.entries.map((e) {
        data.add(e.value);
      });
      return Container(
        margin: const EdgeInsets.only(
          bottom: 15,
          left: 20,
          right: 10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Cart',
                      style: poppinsMedium.copyWith(
                        fontSize: 20,
                      ),
                    ),
                    20.0.horizontalSpacer,
                    value.items.isEmpty
                        ? const SizedBox.shrink()
                        : Row(
                            children: List.generate(
                              data.length,
                              (index) => Container(
                                width: 35,
                                height: 35,
                                margin: const EdgeInsets.only(
                                  right: 10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    17.5,
                                  ),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Image.asset(
                                    data[index].url,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ).toList(),
                          ),
                  ],
                ),
                Container(
                  width: 35,
                  height: 35,
                  margin: const EdgeInsets.only(
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      17.5,
                    ),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      value.items.length.toString(),
                      style: poppinsMedium.copyWith(
                        fontSize: 19,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
