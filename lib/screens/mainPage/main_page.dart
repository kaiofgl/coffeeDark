import 'package:coffeedark/components/colors.dart';
import 'package:coffeedark/screens/cartPage/cart_page.dart';
import 'package:coffeedark/screens/favoritePage/favorites_page.dart';
import 'package:coffeedark/screens/homePage/home_page.dart';
import 'package:coffeedark/screens/profilePage/profile_page.dart';
import 'package:coffeedark/screens/videosPage/videos_page.dart';
import 'package:flutter/material.dart';
import 'package:coffeedark/bloc/cart_bloc.dart';

import '../../components/BottomSheet/bottom_sheet.dart';
// import 'package:custom'

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;

  final bool _loggedIn = false;

  String nameCity = "Franca";
  String nameState = "São Paulo";

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  List<Widget> pageList = <Widget>[
    const HomePage(),
    const FavoritesPage(),
    const CartPage(),
    const ProfilePage(),
    const VideoPage()
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Future<void> _onRefresh() async {
  //   print("refresh");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      endDrawer: const Drawer(
        child: Text("ola"),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Ink(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
          child: InkWell(
            borderRadius: BorderRadius.circular(50),
            child: Center(
              child: (_loggedIn == true)
                  ? const Icon(
                      Icons.person,
                      color: Colors.black,
                    )
                  : Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                            "https://thispersondoesnotexist.com/image?"),
                      ),
                    ),
            ),
            onTap: () => _key.currentState!.openDrawer(),
          ),
        ),
        title: Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.gps_fixed, color: mainThemeColor),
              Text(
                nameCity + ", ",
                style: TextStyle(
                  fontFamily: 'Publica Sans',
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: mainThemeColor,
                ),
              ),
              Text(
                nameState,
                style: const TextStyle(
                  fontFamily: 'Publica Sans',
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Ink(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              child: Center(
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Icon(
                    Icons.notifications_none,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
              onTap: () => _key.currentState!.openEndDrawer(),
            ),
          ),
        ],
      ),
      drawer: const Drawer(),
      body: IndexedStack(
        index: _selectedIndex,
        children: pageList,
      ),
      floatingActionButton: Visibility(
        visible: (_selectedIndex == 2) ? false : true,
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              context: context,
              builder: (context) {
                return bottomSheetCart(context);
              },
            );
          },
          backgroundColor: secondaryThemeColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder(
                initialData: 0,
                stream: bloc.cartItens,
                builder: (context, snapshot) {
                  return Text(bloc.itensCart.length.toString());
                },
              ),
              const Icon(Icons.shopping_bag_sharp)
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(
          fontFamily: 'Publica Sans',
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'Publica Sans',
          fontWeight: FontWeight.w500,
        ),
        unselectedItemColor: colorUnselectedFont,
        fixedColor: mainThemeColor,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Início",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: "Favoritos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Carrinho",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Perfil",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: "Vídeos",
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onTap,
      ),
    );
  }
}
