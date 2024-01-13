import 'package:cart_hero_animation/Commons/Models/fruit_model.dart';
import 'package:cart_hero_animation/Commons/Utils/extensions.dart';
import 'package:cart_hero_animation/Commons/Views/Fruit%20Details/view.dart';
import 'package:cart_hero_animation/Commons/Widgets/all_fruit_header.dart';
import 'package:cart_hero_animation/Commons/Widgets/all_fruits_footer.dart';
import 'package:cart_hero_animation/Providers/all_fruits_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllFruitsPage extends StatefulWidget {
  const AllFruitsPage({super.key});

  @override
  State<AllFruitsPage> createState() => _AllFruitsPageState();
}

class _AllFruitsPageState extends State<AllFruitsPage> {
  @override
  void initState() {
    super.initState();
    context.read<AllFruitsProvider>().getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      bottomNavigationBar: const AllFruitsFooter(),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.only(
          top: 20,
          left: 10,
          right: 10,
        ),
        height: context.screenHeigth - context.screenHeigth / 8,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(
              25,
            ),
            bottomRight: Radius.circular(
              25,
            ),
          ),
        ),
        child: Column(
          children: [
            const AllFruitsHeader(),
            5.0.verticalSpacer,
            Expanded(
              child: GridView.builder(
                itemCount: Provider.of<AllFruitsProvider>(context).data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 20,
                  mainAxisExtent: context.screenHeigth / 3.3 + 30,
                ),
                itemBuilder: (context, index) {
                  final FruitModel fruit =
                      Provider.of<AllFruitsProvider>(context).data[index];

                  final FruitModel fruitModel = FruitModel(
                    description: fruit.description,
                    id: fruit.id,
                    name: fruit.name,
                    price: fruit.price,
                    url: fruit.url,
                    category: fruit.category,
                  );
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              FruitDetailsPage(fruitModel: fruitModel),
                        ),
                      );
                    },
                    child: fruitModel.toGridViewTile(
                      context,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
