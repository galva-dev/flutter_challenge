import 'package:flutter/material.dart';
import 'package:flutter_challenge/projects/muebleria_app/constants.dart';
import 'package:flutter_challenge/projects/muebleria_app/models/product.dart';
import 'package:flutter_challenge/projects/muebleria_app/screens/details/components/body.dart';
import 'package:flutter_challenge/projects/muebleria_app/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreenMuebleria extends StatelessWidget {
  const DetailsScreenMuebleria({Key? key, required this.product})
      : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: BuildAppBar(context),
      body: BodyDetailsMuebleria(product: product),
    );
  }

  AppBar BuildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset(
          "assets/icons/muebleria_app/arrow-long-left.svg",
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/muebleria_app/bag.svg",
          ),
        ),
        SizedBox(
          width: SizeConfig.defaultSize,
        )
      ],
    );
  }
}
