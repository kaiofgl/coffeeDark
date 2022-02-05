import 'package:coffeedark/components/BottomSheet/bottom_sheet.dart';
import 'package:coffeedark/components/colors.dart';
import 'package:coffeedark/components/text_style.dart';
import 'package:flutter/material.dart';
import 'component/products_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FocusNode _focus = FocusNode();

  int listSelected = 0;

  var listCategories = {
    0: 'Capuccino',
    1: 'Café',
    2: 'Mocha',
  };

  var listProductsGarnish = {
    'Chocolate': 0,
    'Ovomaltine': 1,
  };
  var products = [
    {
      'product_id': 0,
      'product_name': 'Capuccino Vert',
      'listCategoriesId': 0,
      'with': 'chocolate',
      'listProductsGarnishId': {
        0: 0,
      },
      'price': 9.50,
      'rate': 4.7,
      'photo_path':
          'https://st2.depositphotos.com/5355656/7813/i/600/depositphotos_78138608-stock-photo-a-cup-of-cappuccino.jpg'
    },
    {
      'product_id': 1,
      'product_name': 'Capuccino Lazer',
      'listCategoriesId': 0,
      'with': 'chocolate',
      'listProductsGarnishId': {
        0: 0,
      },
      'price': 12.50,
      'rate': 4.7,
      'photo_path':
          'https://www.reservademinas.com.br/wp-content/uploads/04_06blog.png'
    },
    {
      'product_id': 2,
      'product_name': 'Capuccino La Santa',
      'listCategoriesId': 0,
      'with': 'chocolate',
      'listProductsGarnishId': {
        0: 0,
      },
      'price': 7.0,
      'rate': 4.7,
      'photo_path':
          'https://s2.glbimg.com/8SHT9Lh49jd5lHDquh24AMSBflk=/0x0:1280x853/924x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_e84042ef78cb4708aeebdf1c68c6cbd6/internal_photos/bs/2020/A/6/5aZNebQ1qUwUjiZdQRWg/capuccino.jpeg'
    },
    {
      'product_id': 3,
      'product_name': 'Capuccino La',
      'listCategoriesId': 0,
      'with': 'chocolate',
      'listProductsGarnishId': {
        0: 0,
      },
      'price': 12.50,
      'rate': 4.7,
      'photo_path':
          'https://media-cdn.tripadvisor.com/media/photo-s/12/9c/55/46/cappuccino-viriato-com.jpg'
    },
    {
      'product_id': 4,
      'product_name': 'Café Preto',
      'listCategoriesId': 1,
      'with': 'chocolate',
      'listProductsGarnishId': {
        0: 0,
      },
      'price': 8.50,
      'rate': 4.7,
      'photo_path':
          'http://s2.glbimg.com/P6Nn4AXYPq-K1Xek4cCKyONYYyA=/e.glbimg.com/og/ed/f/original/2014/01/15/cafe.jpg'
    },
    {
      'product_id': 5,
      'product_name': 'Café Sem Açucar',
      'listCategoriesId': 1,
      'with': 'chocolate',
      'listProductsGarnishId': {
        0: 0,
      },
      'price': 8.50,
      'rate': 4.7,
      'photo_path':
          'https://blog.bicafebrasil.com.br/wp-content/uploads/2021/06/6-CAPA1-BCF-500p-cafe-sem-acucar.jpg'
    },
    {
      'product_id': 6,
      'product_name': 'Mocha La Sante',
      'listCategoriesId': 2,
      'with': 'chocolate',
      'listProductsGarnishId': {
        0: 0,
      },
      'price': 11.50,
      'rate': 4.7,
      'photo_path':
          'https://perfectdailygrind.com/wp-content/uploads/2020/09/Mocha-4.jpg'
    },
    {
      'product_id': 7,
      'product_name': 'Mocha Santan',
      'listCategoriesId': 2,
      'with': 'chocolate',
      'listProductsGarnishId': {
        0: 0,
      },
      'price': 11.50,
      'rate': 4.7,
      'photo_path':
          'https://i2.wp.com/www.franchiseindiaweb.in/wp-content/uploads/2016/11/Cafe-Mocha.jpg?fit=483%2C400&ssl=1'
    },
    {
      'product_id': 8,
      'product_name': 'Mocha Premium',
      'listCategoriesId': 2,
      'with': 'chocolate',
      'listProductsGarnishId': {
        0: 0,
      },
      'price': 15.00,
      'rate': 4.7,
      'photo_path':
          'https://i.pinimg.com/originals/ff/92/24/ff922424b61d6d1af9f4e8a0b58ee1f8.jpg'
    },
  ];

  var actualProductList = [];
  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
    changeActualListProducts(0);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  void changeActualListProducts(int index) {
    actualProductList = [];
    for (var map in products) {
      if (map["listCategoriesId"] == index) {
        actualProductList.add(map);
      }
    }
  }

  void _onCategoriesClick(int index) {
    setState(
      () {
        listSelected = index;
        changeActualListProducts(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
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
                style: h1TextStyle(),
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
                        labelStyle: labelTextStyle(),
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
                                    ),
                                  ),
                                  context: context,
                                  builder: (context) {
                                    return bottomSheetFilters();
                                  },
                                );
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
                padding: EdgeInsets.all(
                  paddingGlobal,
                ),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Categorias",
                    style: h2TextStyle(),
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
                    return Material(
                      child: Padding(
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
                                  entryList[index].value,
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
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: actualProductList.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> product =
                          actualProductList[index] as Map<String, dynamic>;
                      return ProductItem(
                        list: product,
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
                style: h2TextStyle(),
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
                              color: secondaryThemeColor,
                            ),
                            child: SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Descontos de Venda",
                                  style: descountsTitleTextStyle(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(paddingGlobal),
                          child: Text(
                            "Aqui você encontra as nossas ofertas especiais!",
                            style: descountsTextStyle(),
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
      ),
    );
  }
}
