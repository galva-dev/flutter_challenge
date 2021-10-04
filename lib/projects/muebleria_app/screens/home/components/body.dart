import 'package:flutter/material.dart';
import 'package:flutter_challenge/projects/muebleria_app/components/title_text.dart';
import 'package:flutter_challenge/projects/muebleria_app/models/category.dart';
import 'package:flutter_challenge/projects/muebleria_app/screens/home/components/category_card.dart';
import 'package:flutter_challenge/projects/muebleria_app/services/fetch_categories.dart';
import 'package:flutter_challenge/projects/muebleria_app/size_config.dart';

class BodyMuebleria extends StatelessWidget {
  const BodyMuebleria({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(defaultSize! * 2),
          child: TitleText(title: "Busca por categorias"),
        ),
        FutureBuilder<List<Category>>(
          future: fetchCategories(),
          builder: (context, snapshot) => snapshot.hasData
              ? Categories(
                  categories: (snapshot.data!),
                )
              : Center(
                  child: Image.asset(
                    "assets/icons/muebleria_app/ripple.gif",
                  ),
                ),
        ),
      ],
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            category: categories[index],
          ),
        ),
      ),
    );
  }
}
