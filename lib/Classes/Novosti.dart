import 'package:flutter/material.dart';

class Novosti extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;

  const Novosti({
    Key key,
    this.title,
    @required this.imageUrl,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(imageUrl),
        ),
      ),
    );
  }
}
