import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSliderComponent extends StatelessWidget {
  final List<Map<String, String>> carouselItems;

  CarouselSliderComponent({required this.carouselItems});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: carouselItems.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                carouselItems[index]['imageUrl']!,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                carouselItems[index]['title']!,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                carouselItems[index]['author']!,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        );
      },
      options: CarouselOptions(
        height: 300,
        aspectRatio: 9 / 16,
        // Updated aspect ratio for vertical layout
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.vertical, // Updated to vertical scroll
      ),
    );
  }
}
