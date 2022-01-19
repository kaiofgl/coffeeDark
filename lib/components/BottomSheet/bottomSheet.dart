import 'package:flutter/material.dart';

Widget bottomSheetFilters() {
  return Container(
    height: 300,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Center(
        child: Text(
      "Filters",
      style: TextStyle(fontFamily: 'Publica Sans'),
    )),
  );
}
