import 'package:flutter/material.dart';

TextStyle h1_textStyle() {
  return const TextStyle(
    fontFamily: 'Publica Sans',
    fontWeight: FontWeight.w700,
    fontSize: 20,
    color: Colors.black,
  );
}

TextStyle h2_textStyle() {
  return const TextStyle(
    fontFamily: 'Publica Sans',
    fontWeight: FontWeight.w700,
    fontSize: 17,
    color: Colors.black,
  );
}

TextStyle label_textStyle() {
  return const TextStyle(
      fontFamily: 'Publica Sans', fontWeight: FontWeight.w500, fontSize: 14);
}

TextStyle product_title_textStyle() {
  return const TextStyle(
    fontFamily: 'Publica Sans',
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
}

TextStyle product_garnish_textStyle() {
  return const TextStyle(
    fontFamily: 'Publica Sans',
    fontWeight: FontWeight.w400,
    color: Color(0xffb2b2b2),
    fontSize: 10,
  );
}

TextStyle product_price_textStyle(double? sizeR) {
  return TextStyle(
    fontFamily: 'Publica Sans',
    fontWeight: FontWeight.w400,
    // color: Color(0xffb2b2b2),
    fontSize: sizeR,
  );
}

TextStyle descounts_title_textStyle() {
  return const TextStyle(
    fontFamily: 'Publica Sans',
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontSize: 15,
  );
}

TextStyle descounts_textStyle() {
  return const TextStyle(
    fontFamily: 'Publica Sans',
    fontWeight: FontWeight.w500,
    fontSize: 15,
  );
}
