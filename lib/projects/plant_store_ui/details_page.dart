import 'package:flutter/material.dart';

class DetailsPagePlantUI extends StatelessWidget {
  DetailsPagePlantUI({Key? key}) : super(key: key);

  var greenColor = Color(0xff32a05f);
  var dark_green_color = Color(0xff279152);
  var url_plant =
      "https://static.vecteezy.com/system/resources/previews/002/740/763/non_2x/plant-inside-a-pot-with-white-background-free-vector.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenColor,
      body: Padding(
        padding: EdgeInsets.only(top: 40, left: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Galva inc.",
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Producto\nSeleccionado",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.only(right: 90),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Agua",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.wb_incandescent,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Humedad",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.straighten,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Tamaño",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Cada 7 dias",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                      Text(
                        "Arriba del 82%",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                      Text(
                        "38\" - 45\"",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
