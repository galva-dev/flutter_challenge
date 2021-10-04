import 'package:flutter/material.dart';
import 'package:flutter_challenge/projects/muebleria_app/models/product.dart';
import 'package:flutter_challenge/projects/muebleria_app/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductInfoMuebleria extends StatelessWidget {
  const ProductInfoMuebleria({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    TextStyle lightTextStyle = TextStyle(
      color: Colors.black.withOpacity(0.6),
    );
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultSize! * 2),
      height: defaultSize * 37.5,
      width: defaultSize * (SizeConfig.orientation == Orientation.landscape ? 35 : 15),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              product.category.toUpperCase(),
              style: lightTextStyle,
            ),
            SizedBox(
              height: defaultSize,
            ),
            Text(
              product.title,
              style: TextStyle(
                fontSize: defaultSize * 2.4,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.8,
                height: 1.4,
              ),
            ),
            SizedBox(height: defaultSize * 2),
            Text(
              "Precio",
              style: lightTextStyle,
            ),
            Text(
              "\$${product.price}",
              style: TextStyle(
                fontSize: defaultSize * 1.6,
                fontWeight: FontWeight.bold,
                height: 1.6,
              ),
            ),
            SizedBox(height: defaultSize * 2),
            Text(
              "Colores disponibles",
              style: lightTextStyle,
            ),
            Row(
              children: [
                BuildColorBox(defaultSize, color: Colors.green.shade400, isActive: true),
                BuildColorBox(defaultSize, color: Colors.blue.shade400, isActive: false),
                BuildColorBox(defaultSize, color: Colors.red.shade400, isActive: true),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container BuildColorBox(double defaultSize, {Color? color, bool isActive = false}) {
    return Container(
          margin: EdgeInsets.only(top: defaultSize, right: defaultSize),
          padding: EdgeInsets.all(5),
          height: defaultSize * 2.4,
          width: defaultSize * 2.4,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          child: isActive ? SvgPicture.asset("assets/icons/muebleria_app/check.svg") : SizedBox(),
        );
  }
}
