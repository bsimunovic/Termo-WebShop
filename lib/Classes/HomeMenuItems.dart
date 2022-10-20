import 'package:flutter/material.dart';

class HomeMenuItems {
  final int id;
  final String title;
  final String imageUrl;
  final String tipProizvoda;
  bool isExpanded;

  HomeMenuItems({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    this.isExpanded = false,
    @required this.tipProizvoda,
  });
}
