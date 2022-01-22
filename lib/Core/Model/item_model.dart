import 'package:flutter/cupertino.dart';

class ItemModel {
  final String itemName;
  final String itemSvg;
  final String ontapRoutes;
  final Color svgColor;

  ItemModel({
    required this.itemName,
    required this.itemSvg,
    required this.ontapRoutes,
    required this.svgColor,
  });
}
