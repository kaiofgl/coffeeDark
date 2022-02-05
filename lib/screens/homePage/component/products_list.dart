import 'package:flutter/material.dart';
import 'package:coffeedark/components/colors.dart';
import 'package:coffeedark/components/text_style.dart';
import 'package:intl/intl.dart';
import 'package:coffeedark/bloc/cart_bloc.dart';

class ProductItem extends StatelessWidget {
  ProductItem({
    Key? key,
    required this.list,
  }) : super(key: key);

  final Map<String, dynamic> list;

  final formatCurrence = NumberFormat.simpleCurrency(
    locale: "pt_BR",
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: (list.isEmpty)
          ? Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(30),
              ),
              height: 210,
              width: 130,
              child: const Text('Sem produtos'),
            )
          : Container(
              decoration: BoxDecoration(
                color: const Color(0xffF4F4F4),
                borderRadius: BorderRadius.circular(30),
              ),
              width: 130,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 110,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        list['photo_path'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                      left: 15.0,
                      right: 15.0,
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        list['product_name'],
                        style: productTitleTextStyle(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                      right: 15.0,
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Com " + list['with'],
                        style: productGarnishTextStyle(),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                      right: 15.0,
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                formatCurrence.format(list["price"]),
                                style: productPriceTextStyle(20.0),
                              ),
                            ],
                          ),
                          Material(
                            child: Ink(
                              decoration: BoxDecoration(
                                color: mainThemeColor,
                                border: Border.all(
                                  width: 0.0,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(50),
                                customBorder: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                onTap: () {
                                  bloc.addCart(list);
                                },
                                child: SizedBox(
                                  child: Center(
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 8.0,
                                          right: 8.0,
                                          top: 5.0,
                                          bottom: 5.0,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: const [
                                            Text(
                                              "Carrinho",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Publica Sans',
                                                fontWeight: FontWeight.w300,
                                                fontSize: 14,
                                              ),
                                            ),
                                            Icon(
                                              Icons.add,
                                              size: 19,
                                              color: Colors.white,
                                            )
                                          ],
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
