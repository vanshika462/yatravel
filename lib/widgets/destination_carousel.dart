import 'package:flutter/material.dart';
import 'package:yatravel/models/options_model.dart';
import 'package:yatravel/widgets/food_carousel.dart';

class DestinationCarousel extends StatelessWidget {
  final String state;

  DestinationCarousel(this.state);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Explore ',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 300.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: options.length,
            itemBuilder: (BuildContext context, int index) {
    Option option = options[index];
    return GestureDetector(
    onTap: () => Navigator.push(
    context,
    MaterialPageRoute(
    builder: (_) => FoodCarousel(state),
    ),
    ),
    );
    }
    ),
        ),
      ],
    );
    }
  }