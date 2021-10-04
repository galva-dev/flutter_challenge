import 'package:flutter/material.dart';
import 'package:flutter_challenge/projects/muebleria_app/constants.dart';
import 'package:flutter_challenge/projects/muebleria_app/models/product.dart';
import 'package:flutter_challenge/projects/muebleria_app/screens/details/components/product_description.dart';
import 'package:flutter_challenge/projects/muebleria_app/screens/details/components/product_info.dart';
import 'package:flutter_challenge/projects/muebleria_app/size_config.dart';

class BodyDetailsMuebleria extends StatelessWidget {
  const BodyDetailsMuebleria({Key? key, required this.product})
      : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: SizeConfig.orientation == Orientation.landscape
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight! - AppBar().preferredSize.height,
        child: Stack(
          children: [
            ProductInfoMuebleria(product: product),
            Positioned(
              top: defaultSize! * 37.5,
              left: 0,
              right: 0,
              child: ProductDescriptionMuebleria(
                product: product,
                function: () {},
              ),
            ),
            Positioned(
              top: defaultSize * 9.5,
              right: -defaultSize * (SizeConfig.orientation == Orientation.landscape ? 1 : 4.5),
              child: Hero(
                tag: product.id,
                child: Image.network(
                  product.image,
                  height: defaultSize * 37.8,
                  width: defaultSize * 36.4,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
