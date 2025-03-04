import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarrouselImg extends StatelessWidget {
  final List<String> imgList;

  const CarrouselImg({super.key, required this.imgList});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150.0,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
      ),
      items: imgList.map((item) {
        return ClipRRect(
          //borderRadius: BorderRadius.circular(10.0), // Bordes redondeados
          child: Image.network(
            item,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        );
      }).toList(),
    );
  }
}

