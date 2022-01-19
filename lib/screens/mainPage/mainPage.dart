import 'package:coffeedark/components/colors.dart';
import 'package:coffeedark/screens/cartPage/cartPage.dart';
import 'package:coffeedark/screens/favoritePage/favoritesPage.dart';
import 'package:coffeedark/screens/homePage/homePage.dart';
import 'package:coffeedark/screens/profilePage/profilePage.dart';
import 'package:coffeedark/screens/videosPage/videosPage.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
// import 'package:custom'

import 'dart:developer';

import 'package:flutter/rendering.dart';

class MainPage extends StatefulWidget {
  final Widget child;

  const MainPage({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  static const _indicatorSize = 150.0;
  final _helper = IndicatorStateHelper();

  bool _renderCompleteState = false;

  ScrollDirection prevScrollDiretion = ScrollDirection.idle;

  @override
  void initState() {
    super.initState();
    print("chego");
  }

  int _selectedIndex = 0;

  bool _logged_in = false;

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

  Future<void> _onRefresh() async {
    print("refresh");
  }

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
              child: (_logged_in == true)
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
      drawer: Drawer(),
      body: CustomRefreshIndicator(
        child: widget.child,
        builder: (
          BuildContext context,
          Widget child,
          IndicatorController controller,
        ) {
          return pageList[_selectedIndex];
        },
        onRefresh: _onRefresh,
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
