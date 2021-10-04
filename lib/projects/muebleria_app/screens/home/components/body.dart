import 'package:flutter/material.dart';
import 'package:flutter_challenge/projects/muebleria_app/components/title_text.dart';
import 'package:flutter_challenge/projects/muebleria_app/models/category.dart';
import 'package:flutter_challenge/projects/muebleria_app/models/product.dart';
import 'package:flutter_challenge/projects/muebleria_app/screens/home/components/recommand_products.dart';
import 'package:flutter_challenge/projects/muebleria_app/screens/home/components/categories.dart';
import 'package:flutter_challenge/projects/muebleria_app/services/fetch_categories.dart';
import 'package:flutter_challenge/projects/muebleria_app/services/fetch_products.dart';
import 'package:flutter_challenge/projects/muebleria_app/size_config.dart';

class BodyMuebleria extends StatelessWidget {
  const BodyMuebleria({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;

    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(defaultSize! * 2),
              child: TitleText(title: "Busca por categorias"),
            ),
            FutureBuilder<List<Category>>(
              future: fetchCategories(),
              builder: (context, snapshot) => snapshot.hasData
                  ? Categories(categories: (snapshot.data!))
                  : Center(
                      child: Image.asset(
                        "assets/icons/muebleria_app/ripple.gif",
                      ),
                    ),
            ),
            Divider(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.all(defaultSize * 2),
              child: TitleText(title: "Recomendados para ti"),
            ),
            FutureBuilder<List<Product>>(
              future: fetchProducts(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? RecommandProducts(
                        products: snapshot.data!,
                      )
                    : Center(
                        child: Image.asset(
                          "assets/icons/muebleria_app/ripple.gif",
                        ),
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
