// ignore: file_names
import 'package:coffeedark/components/cart/item_cart.dart';
import 'package:coffeedark/components/colors.dart';
import 'package:coffeedark/components/text_style.dart';
import 'package:flutter/material.dart';
import 'package:coffeedark/bloc/cart_bloc.dart';
import 'package:intl/intl.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final formatCurrence = NumberFormat.simpleCurrency(locale: "pt_BR");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: paddingGlobal,
            right: paddingGlobal,
            top: paddingGlobal,
          ),
          child: Container(
            alignment: Alignment.centerLeft,
            height: 50,
            child: Text(
              "Carrinho",
              style: h1TextStyle(),
            ),
          ),
        ),
        Expanded(
          child: StreamBuilder(
            stream: bloc.cartItens,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (bloc.itensCart.isNotEmpty) {
                List<Map> list = snapshot.data;
                return ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: paddingGlobal,
                          right: paddingGlobal,
                        ),
                        child: ItemCart(
                            photoPath: list[index]['photo_path'],
                            productName: list[index]['product_name'],
                            price: list[index]['price'],
                            index: index),
                      );
                    });
              } else {
                return SizedBox(
                  height: 300,
                  child: Center(
                    child: Text(
                      "Sem produtos no carrinho :(",
                      textAlign: TextAlign.center,
                      style: productPriceTextStyle(16),
                    ),
                  ),
                );
              }
            },
          ),
        ), // Spacer(),
        SizedBox(
          height: 100,
          child: Column(children: [
            Padding(
                padding: EdgeInsets.only(
                  top: paddingGlobal,
                  left: paddingGlobal,
                  right: paddingGlobal,
                ),
                child: StreamBuilder(
                  stream: bloc.cartItens,
                  builder: ((context, snapshot) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Valor total",
                          style: productPriceTextStyle(17),
                        ),
                        Text(
                          formatCurrence.format(bloc.totalCoust()),
                          style: productPriceTextStyle(17),
                        )
                      ],
                    );
                  }),
                )),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: paddingGlobal,
                      right: paddingGlobal,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: Ink(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        height: 40,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {},
                          child: const Center(
                            child: Text(
                              "Finalizar compra",
                              style: TextStyle(
                                fontFamily: 'Publica Sans',
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
      ],
    );
  }
}
