import 'package:flutter/material.dart';

class Shoes {
  final String url;
  final String name;
  final String price;
  final List<Color> colors; 

  static List<Shoes> shoes = [
    Shoes(
      url:
          "https://i.postimg.cc/v86dQgGJ/pngwing-com.png",
      name: "Nike Air",
      price: "243",
      colors: [
        Colors.red.shade200,
        Colors.red.shade700,
      ]
    ),
    Shoes(
      url:
          "https://i.postimg.cc/3xNscdff/pngwing-com.png",
      name: "Nike Air 2",
      price: "213",
      colors: [
        Colors.blue.shade200,
        Colors.blue.shade700,
      ]
    ),
    Shoes(
      url:
          "https://i.postimg.cc/8PZ84h4r/pngwing-com-1.png",
      name: "Nike Air 3",
      price: "293",
      colors: [
        Colors.yellow.shade200,
        Colors.yellow.shade700,
      ]
    ),
    Shoes(
      url:
          "https://i.postimg.cc/MZbJMkj5/pngwing-com-2.png",
      name: "Nike Air 4",
      price: "123",
      colors: [
        Colors.green.shade200,
        Colors.green.shade700,
      ]
    ),
    Shoes(
      url:
          "https://i.postimg.cc/28kRnHQD/pngwing-com-3.png",
      name: "Nike Air 5",
      price: "321",
      colors: [
        Colors.purple.shade200,
        Colors.purple.shade700,
      ]
    ),
  ];

  const Shoes({
    required this.url,
    required this.name,
    required this.price,
    required this.colors,
  });
}
