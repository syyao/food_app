import 'package:flutter/material.dart';
import 'package:food_app/challengeUI_2/models/foodModel.dart';

import 'drawer.dart';
import 'models/food_data.dart';

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
  Widget foodMenu(String image) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
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
                'Veggie',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                'Tomato mix',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'N1,900',
                style: TextStyle(
                    color: Color.fromRGBO(239, 46, 41, 1),
                    fontWeight: FontWeight.bold),
              ),
            ],
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

  Widget item(String title, int page) {
    return InkWell(
      onTap: () {
        controller.animateToPage(page,
            duration: Duration(milliseconds: 400), curve: Curves.easeIn);
        setState(() {
          currentIndex = page;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(
                bottom: BorderSide(
                    color: page == currentIndex
                        ? Color.fromRGBO(239, 46, 41, 1)
                        : Colors.transparent,
                    width: 2))),
        child: Column(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
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
    _tabController = new TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            child: ListView(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Delicious\nfood for you',
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
                            hintText: 'search',
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
                    tabs: [
                      // FOOD_CATEGORIE
                      //     .map(
                      //       (catData) => Container(
                      //         padding: EdgeInsets.symmetric(
                      //             horizontal: 20, vertical: 10),
                      //         child: new Text(
                      //           'Foods',
                      //         ),
                      //       ),
                      //     )
                      //     .toList(),
                      ListView.builder(
                          itemCount: FOOD_CATEGORIE.length,
                          itemBuilder: (context, i) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: new Text(FOOD_CATEGORIE[i].titre),
                            );
                          }),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: new Text(
                          'Foods',
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: new Text(
                          'Drives',
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: new Text(
                          'Snacks',
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: new Text(
                          'Sauces',
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: new Text(
                          'Sauces',
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: new Text(
                          'Foods',
                        ),
                      ),
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
                // Container(
                //   width: MediaQuery.of(context).size.width,
                //   height: 50,
                //   child: ListView(
                //     scrollDirection: Axis.horizontal,
                //     children: <Widget>[
                //       item('Foods', 0),
                //       item('Drives', 1),
                //       item('Snacks', 2),
                //       item('Sauces', 3),
                //       item('Sauces', 4),
                //     ],
                //   ),
                // ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'see more',
                        style: TextStyle(
                          color: Color.fromRGBO(239, 46, 41, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        foodMenu('images/food.png'),
                        SizedBox(height: 100),
                        foodMenu('images/food.png'),
                        SizedBox(height: 100),
                        foodMenu('images/food.png'),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(height: 100),
                        foodMenu('images/food1.png'),
                        SizedBox(height: 100),
                        foodMenu('images/food1.png'),
                        SizedBox(height: 100),
                        foodMenu('images/food1.png'),
                      ],
                    ),
                  ],
                )
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
    );
  }
}
