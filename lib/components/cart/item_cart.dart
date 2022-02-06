import 'package:coffeedark/bloc/cart_bloc.dart';
import 'package:coffeedark/components/colors.dart';
import 'package:coffeedark/components/text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemCart extends StatelessWidget {
  ItemCart({
    Key? key,
    required this.photoPath,
    required this.productName,
    required this.price,
    required this.index,
  }) : super(key: key);

  final String photoPath;
  final String productName;
  final double price;
  final int index;

  final formatCurrence = NumberFormat.simpleCurrency(
    locale: "pt_BR",
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffF4F4F4),
        ),
        height: 80,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  photoPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 15.0,
                          top: 8.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productName,
                              style: productTitleTextStyle(),
                            ),
                            Text(
                              formatCurrence.format(price),
                              style: productPriceTextStyle(15),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Ink(
                                    height: 23,
                                    width: 23,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: InkWell(
                                      onTap: () {},
                                      borderRadius: BorderRadius.circular(50),
                                      child: const Icon(Icons.remove),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8.0,
                                      right: 8.0,
                                    ),
                                    child: Text(
                                      "0",
                                      style: productPriceTextStyle(16),
                                    ),
                                  ),
                                  Ink(
                                    height: 23,
                                    width: 23,
                                    decoration: BoxDecoration(
                                      color: mainThemeColor,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: InkWell(
                                      onTap: () {},
                                      borderRadius: BorderRadius.circular(50),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Material(
                        color: Colors.transparent,
                        child: Ink(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: InkWell(
                            onTap: () {
                              bloc.removeCart(bloc.itensCart[index]);
                            },
                            borderRadius: BorderRadius.circular(50),
                            child: Icon(
                              Icons.delete,
                              color: mainThemeColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
