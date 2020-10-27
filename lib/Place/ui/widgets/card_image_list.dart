import 'package:flutter/material.dart';
import 'card_image.dart';

class CardImageList extends StatelessWidget {


  IconData iconFilled = Icons.favorite_outlined;
  IconData iconWithBorder = Icons.favorite_border_outlined;
  double height = 250.0;
  double width = 350.0;
  double left = 20.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      child: ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImageWithFabIcon(
            pathImage: "assets/img/waterfall.jpg",
            height: height,
            width: width,
            left: left,
            iconFilled: iconFilled,
            iconWithBorder: iconWithBorder,
            onPressed: (){},
          ),
          CardImageWithFabIcon(
            pathImage: "assets/img/waterfall2.jpg",
            height: height,
            width: width,
            left: left,
            iconWithBorder: iconWithBorder,
            iconFilled: iconFilled,
            onPressed: (){},
          ),
          CardImageWithFabIcon(
            pathImage: "assets/img/fall.jpg",
            height: height,
            width: width,
            left: left,
            iconFilled: iconFilled,
            iconWithBorder: iconWithBorder,
            onPressed: (){},
          ),
          CardImageWithFabIcon(
            pathImage: "assets/img/forest.jpg",
            height: height,
            width: width,
            left: left,
            iconFilled: iconFilled,
            iconWithBorder: iconWithBorder,
            onPressed: (){},
          ),
          CardImageWithFabIcon(
            pathImage: "assets/img/rock.jpg",
            height: height,
            width: width,
            left: left,
            iconFilled: iconFilled,
            iconWithBorder: iconWithBorder,
            onPressed: (){},
          ),
          CardImageWithFabIcon(
            pathImage: "assets/img/camping.jpg",
            height: height,
            width: width,
            left: left,
            iconFilled: iconFilled,
            iconWithBorder: iconWithBorder,
            onPressed: (){},
          ),
        ],
      ),
    );
  }
}
