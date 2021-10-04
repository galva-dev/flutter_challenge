import 'package:flutter/material.dart';
import 'package:flutter_challenge/projects/muebleria_app/constants.dart';
import 'package:flutter_challenge/projects/muebleria_app/screens/home/components/body.dart';
import 'package:flutter_challenge/projects/muebleria_app/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreenMuebleria extends StatefulWidget {
  const HomeScreenMuebleria({Key? key}) : super(key: key);

  @override
  _HomeScreenMuebleriaState createState() => _HomeScreenMuebleriaState();
}

class _HomeScreenMuebleriaState extends State<HomeScreenMuebleria> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: BodyMuebleria(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/muebleria_app/menu.svg",
          height: SizeConfig.defaultSize! * 2, //20
        ),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/muebleria_app/scan.svg",
            height: SizeConfig.defaultSize! * 2.4, //24
          ),
          onPressed: () {},
        ),
        Center(
          child: Text(
            "Scan",
            style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: SizeConfig.defaultSize),
      ],
    );
  }
}
