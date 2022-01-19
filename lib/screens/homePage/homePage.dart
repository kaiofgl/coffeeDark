import 'dart:developer';
import 'package:coffeedark/components/BottomSheet/bottomSheet.dart';
import 'package:coffeedark/components/colors.dart';
import 'package:coffeedark/components/textStyle.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FocusNode _focus = FocusNode();

  bool _hasFocus = false;

  int listSelected = 0;

  var listCategories = {
    'Capuccino': 0,
    'Café Gelado': 1,
    'Espresso': 2,
  };

  var listProductsGarnish = {
    'Chocolate': 0,
    'Ovomaltine': 1,
  };
  var products = {
    0: {
      'product_id': 0,
      'product_name': 'Capuccino Gelado',
      'listCategoriesId': 0,
      'listProductsGarnishId': {
        0: 0,
      },
      'price': 50,
      'rate': 4.7,
      'photo_path':
          'https://st2.depositphotos.com/5355656/7813/i/600/depositphotos_78138608-stock-photo-a-cup-of-cappuccino.jpg'
    },
    1: {
      'product_id': 1,
      'product_name': 'Café Gelado Com Chocolate',
      'listCategoriesId': 1,
      'listProductsGarnishId': {
        0: 0,
      },
      'price': 37,
      'rate': 4.7,
      'photo_path':
          'https://www.anamariabrogui.com.br/assets/uploads/receitas/fotos/usuario-3367-d703592442b3b2d13c64c42e499fab06.jpg'
    },
  };
  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _hasFocus = _focus.hasFocus;
    });
  }

  void _onCategoriesClick(int index) {
    setState(() {
      listSelected = index;
    });
    // _findList(listSelected);
  }

  // Map<String, dynamic> _findList(int listSelected) {
  //   // return 1;
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

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
              "Boa tarde, Kaio",
              style: h1_textStyle(),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: paddingGlobal,
            right: paddingGlobal,
          ),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: TextField(
                    focusNode: _focus,
                    decoration: InputDecoration(
                      fillColor: const Color(0xffF4F4F4),
                      focusColor: Colors.blue,
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      labelText: "Pesquisar café",
                      labelStyle: label_textStyle(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          width: 0.0,
                          color: Colors.transparent,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          width: 20.0,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              (_focus.hasFocus)
                  ? Container()
                  : Padding(
                      padding: EdgeInsets.only(
                        left: paddingGlobal,
                      ),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Ink(
                          padding: EdgeInsets.zero,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {
                              showModalBottomSheet(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  )),
                                  context: context,
                                  builder: (context) {
                                    return bottomSheetFilters();
                                  });
                            },
                            child: const Icon(Icons.person),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.all(paddingGlobal),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Categorias",
                  style: h2_textStyle(),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listCategories.length,
                itemBuilder: (context, index) {
                  var entryList = listCategories.entries.toList();
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        color: (listSelected == index)
                            ? mainThemeColor
                            : Colors.white,
                        border: (listSelected == index)
                            ? Border.all(
                                width: 0.0,
                              )
                            : Border.all(
                                color: Colors.black,
                                width: 2.0,
                              ),

                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                          _onCategoriesClick(index);
                        },
                        child: SizedBox(
                          width: width / 3,
                          child: Center(
                            child: Text(
                              entryList[index].key,
                              style: TextStyle(
                                color: (listSelected == index)
                                    ? Colors.white
                                    : Colors.black,
                                fontFamily: 'Publica Sans',
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: paddingGlobal,
              ),
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffF4F4F4),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        height: 200,
                        width: 130,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 110,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.network(
                                  "https://www.anamariabrogui.com.br/assets/uploads/receitas/fotos/usuario-3367-d703592442b3b2d13c64c42e499fab06.jpg",
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
                                  "Capuccino",
                                  style: product_title_textStyle(),
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
                                  "Com chocolate",
                                  style: product_garnish_textStyle(),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15.0,
                                right: 15.0,
                              ),
                              child: Container(
                                height: 40,
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Text(
                                      "R\$",
                                      style: product_price_textStyle(15.0),
                                    ),
                                    Text(
                                      "9,90",
                                      style: product_price_textStyle(20.0),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        height: 20,
                                        width: 20,
                                        child: FloatingActionButton(
                                          backgroundColor: mainThemeColor,
                                          onPressed: () {},
                                          child: const Icon(
                                            Icons.add,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(paddingGlobal),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Ofertas Especiais",
              style: h2_textStyle(),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: paddingGlobal,
            right: paddingGlobal,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffF4F4F4),
              borderRadius: BorderRadius.circular(30),
            ),
            height: 180,
            width: width,
            child: Row(
              children: [
                SizedBox(
                  height: 180,
                  width: 130,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      "https://www.anamariabrogui.com.br/assets/uploads/receitas/fotos/usuario-3367-d703592442b3b2d13c64c42e499fab06.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: paddingGlobal),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xffDEBB99),
                          ),
                          child: SizedBox(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Descontos de Venda",
                                style: descounts_title_textStyle(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(paddingGlobal),
                        child: Text(
                          "Aqui você encontra as nossas ofertas especiais!",
                          style: descounts_textStyle(),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
