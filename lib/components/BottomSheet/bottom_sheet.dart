import 'package:coffeedark/components/cart/item_cart.dart';
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
                          return ItemCart(
                            photoPath: bloc.itensCart[index]['photo_path'],
                            productName: bloc.itensCart[index]['product_name'],
                            price: bloc.itensCart[index]['price'],
                            index: index,
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
                      child: Material(
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
