import 'package:flutter/material.dart';
import 'package:flutter_challenge/projects/muebleria_app/components/title_text.dart';
import 'package:flutter_challenge/projects/muebleria_app/constants.dart';
import 'package:flutter_challenge/projects/muebleria_app/models/product.dart';
import 'package:flutter_challenge/projects/muebleria_app/size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  final Product product;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    return GestureDetector(
      onTap: press,
      child: Container(
        width: defaultSize! * 14.5,
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: AspectRatio(
          aspectRatio: 0.693,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Hero(
                  tag: product.id,
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/icons/muebleria_app/spinner.gif",
                    image: product.image,
                  ),
                ),
              ),
              TitleText(title: productExample.title),
              SizedBox(height: defaultSize / 2),
              Text("\$${product.price}"),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
