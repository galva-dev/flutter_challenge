import 'package:flutter/material.dart';
import 'package:flutter_challenge/projects/muebleria_app/constants.dart';
import 'package:flutter_challenge/projects/muebleria_app/models/product.dart';
import 'package:flutter_challenge/projects/muebleria_app/size_config.dart';

class ProductDescriptionMuebleria extends StatelessWidget {
  const ProductDescriptionMuebleria({
    Key? key,
    required this.product,
    required this.function,
  }) : super(key: key);

  final Product product;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    return Container(
      constraints: BoxConstraints(minHeight: defaultSize! * 44),
      padding: EdgeInsets.only(
        top: defaultSize * 9,
        left: defaultSize * 2,
        right: defaultSize * 2,
      ),
      height: 500,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(defaultSize * 1.2),
          topRight: Radius.circular(defaultSize * 1.2),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.subTitle,
              style: TextStyle(
                fontSize: defaultSize * 1.8,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: defaultSize * 3,
            ),
            Text(
              product.description,
              style: TextStyle(color: Colors.black.withOpacity(0.6), height: 1.5),
            ),
            SizedBox(
              height: defaultSize * 3,
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(defaultSize * 1.5),
                child: ElevatedButton(
                  onPressed: function,
                  child: Text(
                    "Añadir al carrito",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
