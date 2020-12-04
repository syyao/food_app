import 'package:flutter/material.dart';
import 'package:food_app/challengeUI_2/models/food_data.dart';

import 'drawer.dart';

class PageHom extends StatefulWidget {
  @override
  _PageHomState createState() => _PageHomState();
}

class _PageHomState extends State<PageHom> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: mainDrawer(context),
        backgroundColor: Colors.grey[100],
        body: MainBody());
  }
}

class MainBody extends StatefulWidget {
  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody>
    with SingleTickerProviderStateMixin {
  final controller = PageController(initialPage: 0);
  int currentIndex = 0;
  Widget foodMenu(
    String image,
    String titre,
    final String sousTitre,
    final String price,
  ) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        InkWell(
          onTap: () {},
          child: Container(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width / 3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  offset: Offset(8, 6),
                  blurRadius: 10,
                  color: Colors.grey[300],
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 50),
                Text(
                  titre,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  sousTitre,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  price,
                  style: TextStyle(
                      color: Color.fromRGBO(239, 46, 41, 1),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 15,
          top: MediaQuery.of(context).size.width / -10,
          child: Container(
            height: MediaQuery.of(context).size.width / 5,
            width: MediaQuery.of(context).size.width / 5,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover)),
          ),
        ),
      ],
    );
  }

  Widget itemNav(Color colorIndex, IconData icone, String routeName) {
    return IconButton(
      icon: Icon(icone),
      color: colorIndex,
      onPressed: () {
        Navigator.of(context).pushNamed(routeName);
      },
    );
  }

  TabController _tabController;

  @override
  void initState() {
// TODO: implement initState
    super.initState();
    _tabController =
        new TabController(length: FOOD_CATEGORIE.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(FOOD_CATEGORIE.length);

    return DefaultTabController(
      length: FOOD_CATEGORIE.length,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icon(Icons.menu)),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('cart');
                    },
                    icon: Icon(Icons.shopping_cart, color: Colors.grey),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Délicieux\nPlats pour vous',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width / 1.3,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              hintText: 'rechercher',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 60,
                    child: TabBar(
                      onTap: (val) => print("Tab Bar $val"),
                      tabs: [
                        ...FOOD_CATEGORIE.map((e) => Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: new Text(
                                e.titre,
                              ),
                            )),
                      ],
                      unselectedLabelColor: const Color(0xffacb3bf),
                      indicatorColor: Color.fromRGBO(239, 46, 41, 1),
                      labelColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorWeight: 3,
                      indicatorPadding: EdgeInsets.all(10),
                      isScrollable: true,
                      controller: _tabController,
                    ),
                  ),

                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        ...FOOD_CATEGORIE.map(
                          (e) => GridView.builder(
                            padding: EdgeInsets.only(top: 45, left: 30),
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 205,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 25,
                            ),
                            itemCount: e.listDePLats.length,
                            itemBuilder: (context, i) {
                              return foodMenu(
                                  e.listDePLats[i].image,
                                  e.listDePLats[i].titre,
                                  e.listDePLats[i].sousTitre,
                                  e.listDePLats[i].price);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  //   Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //     children: <Widget>[
                  //       Column(
                  //         children: <Widget>[
                  //           foodMenu('images/food.png'),
                  //           SizedBox(height: 100),
                  //           foodMenu('images/food.png'),
                  //           SizedBox(height: 100),
                  //           foodMenu('images/food.png'),
                  //         ],
                  //       ),
                  //       Column(
                  //         children: <Widget>[
                  //           SizedBox(height: 100),
                  //           foodMenu('images/food1.png'),
                  //           SizedBox(height: 100),
                  //           foodMenu('images/food1.png'),
                  //           SizedBox(height: 100),
                  //           foodMenu('images/food1.png'),
                  //         ],
                  //       ),
                  //     ],
                  //   )
                ],
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: <Widget>[
            //     itemNav(Color.fromRGBO(239, 46, 41, 1), Icons.home, 'pagehom'),
            //     itemNav(Colors.grey, Icons.favorite_border, 'favorite'),
            //     itemNav(Colors.grey, Icons.person, 'profil'),
            //     itemNav(Colors.grey, Icons.schedule, 'schedule'),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
