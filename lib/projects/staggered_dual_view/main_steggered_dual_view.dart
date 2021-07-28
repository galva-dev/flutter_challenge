import 'package:flutter/material.dart';
import 'package:flutter_challenge/projects/staggered_dual_view/meal.dart';

class MainSteggeredDualView extends StatelessWidget {
  const MainSteggeredDualView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "MIS PRODUCTOS",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SteggeredDualView(
          builder: (context, index) {
            return MealItem(
              meal: Meal.meals[index],
            );
          },
          itemCount: Meal.meals.length,
          aspectRatio: 0.65,
          spacing: 30,
        ),
      ),
    );
  }
}

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem({
    Key? key,
    required this.meal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 5,
      shadowColor: Colors.black54,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ClipOval(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    meal.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    meal.name,
                    maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    meal.weight,
                    maxLines: 2,
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                        color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) => Icon(
                        index < 4 ? Icons.star : Icons.star_border,
                        color: Colors.yellow,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SteggeredDualView extends StatelessWidget {
  final IndexedWidgetBuilder builder;
  final int itemCount;
  final double spacing;
  final double aspectRatio;

  const SteggeredDualView({
    Key? key,
    required this.builder,
    required this.itemCount,
    this.spacing = 0.0,
    this.aspectRatio = 0.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, contraints) {
        final width = contraints.maxWidth;
        final itemHeight = (width * 0.5) / aspectRatio;
        final height = contraints.maxHeight + itemHeight;

        return OverflowBox(
          maxWidth: width,
          minWidth: width,
          maxHeight: height,
          minHeight: height,
          child: GridView.builder(
            padding: EdgeInsets.only(top: itemHeight / 2, bottom: itemHeight),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: aspectRatio,
              crossAxisSpacing: spacing,
              mainAxisSpacing: spacing,
            ),
            itemBuilder: (context, index) {
              return Transform.translate(
                offset: Offset(0.0, index.isOdd ? itemHeight * 0.5 : 0.0),
                child: builder(context, index),
              );
            },
            itemCount: itemCount,
          ),
        );
      },
    );
  }
}
