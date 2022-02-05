import 'package:coffeedark/components/colors.dart';
import 'package:coffeedark/components/text_style.dart';
import 'package:flutter/material.dart';
import 'package:coffeedark/bloc/cart_bloc.dart';
import 'package:intl/intl.dart';

Widget bottomSheetFilters() {
  return Container(
    height: 300,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    ),
    child: const Center(
      child: Text(
        "Filters",
        style: TextStyle(fontFamily: 'Publica Sans'),
      ),
    ),
  );
}

Widget bottomSheetCart(BuildContext context) {
  final formatCurrence = NumberFormat.simpleCurrency(locale: "pt_BR");
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text(
            "Carrinho",
            style: bottomSheetTitleTextStyle(),
          ),
          StreamBuilder(
            stream: bloc.cartItens,
            builder: ((context, snapshot) {
              return Flexible(
                child: (bloc.itensCart.isEmpty)
                    ? Center(
                        child: Text(
                          "Carrinho vazio :(",
                          style: productPriceTextStyle(15),
                        ),
                      )
                    : ListView.builder(
                        itemCount: bloc.itensCart.length,
                        itemBuilder: (context, index) {
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
                                        bloc.itensCart[index]['photo_path'],
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
                                                  left: 15.0, top: 8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    bloc.itensCart[index]
                                                        ['product_name'],
                                                    style:
                                                        productTitleTextStyle(),
                                                  ),
                                                  Text(
                                                    formatCurrence.format(
                                                        bloc.itensCart[index]
                                                            ['price']),
                                                    style:
                                                        productPriceTextStyle(
                                                            15),
                                                  ),
                                                  Material(
                                                    color: Colors.transparent,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Ink(
                                                          height: 23,
                                                          width: 23,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                          ),
                                                          child: InkWell(
                                                            onTap: () {},
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                            child: const Icon(
                                                                Icons.remove),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            left: 8.0,
                                                            right: 8.0,
                                                          ),
                                                          child: Text(
                                                            "0",
                                                            style:
                                                                productPriceTextStyle(
                                                                    16),
                                                          ),
                                                        ),
                                                        Ink(
                                                          height: 23,
                                                          width: 23,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                mainThemeColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                          ),
                                                          child: InkWell(
                                                            onTap: () {},
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                            child: const Icon(
                                                              Icons.add,
                                                              color:
                                                                  Colors.white,
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
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    bloc.removeCart(
                                                        bloc.itensCart[index]);
                                                  },
                                                  borderRadius:
                                                      BorderRadius.circular(50),
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
                        },
                      ),
              );
            }),
          ),
          StreamBuilder(
            stream: bloc.cartItens,
            builder: (context, snapshot) {
              return SizedBox(
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Valor total:",
                          style: TextStyle(
                              fontFamily: 'Publica Sans',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.black45),
                        ),
                        Text(
                          formatCurrence.format(
                            bloc.totalCoust(),
                          ),
                          style: productPriceTextStyle(17),
                        ),
                      ],
                    ),
                    Flexible(
                      child: StreamBuilder(
                        stream: bloc.cartItens,
                        builder: (context, snapshot) {
                          return Material(
                            color: Colors.transparent,
                            child: Ink(
                              height: 50,
                              decoration: BoxDecoration(
                                color: secondaryThemeColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: InkWell(
                                onTap: () {},
                                borderRadius: BorderRadius.circular(50),
                                child: Center(
                                  child: Text(
                                    "Ir para o Carrinho",
                                    style: productPriceTextStyle(15),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}
