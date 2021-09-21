import 'package:flutter/material.dart';
import 'package:flutter_challenge/projects/nike_store_ui/brand_selector.dart';
import 'package:flutter_challenge/projects/nike_store_ui/product_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data_shoes.dart';

class NikeStoreUI extends StatefulWidget {
  const NikeStoreUI({Key? key}) : super(key: key);

  @override
  _NikeStoreUIState createState() => _NikeStoreUIState();
}

class _NikeStoreUIState extends State<NikeStoreUI> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.menu,
                      ),
                    ),
                    ClipOval(
                      child: Image.network(
                        "https://i.pinimg.com/236x/3f/a6/6e/3fa66e13a0ab7131c73d13602c3b3e49.jpg",
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 20,
                  bottom: 30,
                ),
                child: Text(
                  "Explore",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
              ),
              BrandSelector(brands: ["Nike", "Converse", "Vans", "Tennis"]),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 400,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: Shoes.shoes.length,
                  itemBuilder: (context, index){
                    Shoes shoe = Shoes.shoes[index];
                    return Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: ProductCard(
                        shoe: shoe,
                        cardNum: index
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
