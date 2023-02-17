import 'package:flutter/material.dart';

class BuildCardCategories extends StatelessWidget {
  const BuildCardCategories({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        width: 80,
        height: 80,
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            //set border radius to 50% of square height and width
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover, //change image fill type
            ),
          ),
        ),
      ),
    );
  }
}
