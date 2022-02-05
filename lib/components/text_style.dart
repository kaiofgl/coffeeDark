import 'package:flutter/material.dart';

TextStyle h1TextStyle() {
  return const TextStyle(
    fontFamily: 'Publica Sans',
    fontWeight: FontWeight.w700,
    fontSize: 20,
    color: Colors.black,
  );
}

TextStyle h2TextStyle() {
  return const TextStyle(
    fontFamily: 'Publica Sans',
    fontWeight: FontWeight.w700,
    fontSize: 17,
    color: Colors.black,
  );
}

TextStyle labelTextStyle() {
  return const TextStyle(
      fontFamily: 'Publica Sans', fontWeight: FontWeight.w500, fontSize: 14);
}

TextStyle productTitleTextStyle() {
  return const TextStyle(
    fontFamily: 'Publica Sans',
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
}

TextStyle bottomSheetTitleTextStyle() {
  return const TextStyle(
    fontFamily: 'Publica Sans',
    fontWeight: FontWeight.w800,
    fontSize: 23,
  );
}

TextStyle productGarnishTextStyle() {
  return const TextStyle(
    fontFamily: 'Publica Sans',
    fontWeight: FontWeight.w400,
    color: Color(0xffb2b2b2),
    fontSize: 10,
  );
}

TextStyle productPriceTextStyle(double? sizeR) {
  return TextStyle(
    fontFamily: 'Publica Sans',
    fontWeight: FontWeight.w400,
    // color: Color(0xffb2b2b2),
    fontSize: sizeR,
  );
}

TextStyle descountsTitleTextStyle() {
  return const TextStyle(
    fontFamily: 'Publica Sans',
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontSize: 15,
  );
}

TextStyle descountsTextStyle() {
  return const TextStyle(
    fontFamily: 'Publica Sans',
    fontWeight: FontWeight.w500,
    fontSize: 15,
  );
}
