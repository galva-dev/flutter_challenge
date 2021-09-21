import 'package:flutter/material.dart';

import 'package:flutter_challenge/projects/nike_store_ui/data_shoes.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  final Shoes shoe;
  final int cardNum;

  const ProductCard({
    Key? key,
    required this.shoe,
    required this.cardNum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 0,
              ),
              child: Container(
                width: 250,
                height: 400,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: shoe.colors,
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(1, 8),
                        blurRadius: 8,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30)),
                child: Stack(
                  children: [
                    Positioned(
                      left: 20,
                      top: 20,
                      child: Text(
                        "0${cardNum + 1}",
                        style: GoogleFonts.ubuntu(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: -10,
            child: Image.network(
              shoe.url,
              width: 270,
              height: 170,
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 15,
                bottom: 15,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shoe.name,
                    style: GoogleFonts.ubuntu(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "\$${shoe.price}",
                    style: GoogleFonts.ubuntu(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
