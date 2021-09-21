import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BrandSelector extends StatefulWidget {
  final List<String> brands;
  BrandSelector({required this.brands});

  @override
  _BrandSelectorState createState() => _BrandSelectorState();
}

class _BrandSelectorState extends State<BrandSelector> {
  int _currentIndex = 0;
  late bool _isSelected;

  List<Widget> _buildShoreBrands() {
    return widget.brands.map((e) {
      var index = widget.brands.indexOf(e);
      _isSelected = _currentIndex == index;
      return Padding(
        padding: const EdgeInsets.only(left: 20),
        child: GestureDetector(
          onTap: () {
            setState(() {
              _currentIndex = index;
            });
          },
          child: Text(
            e,
            style: GoogleFonts.ubuntu(
              color: _isSelected ? Colors.black : Colors.grey,
              fontSize: _isSelected ? 22 : 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _buildShoreBrands(),
    );
  }
}
