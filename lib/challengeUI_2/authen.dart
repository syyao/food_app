import 'package:flutter/material.dart';
import 'package:food_app/settings/settings.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> with SingleTickerProviderStateMixin {
  final controller = PageController(initialPage: 0);
  TabController _tabController;
  int currentIndex = 0;
  @override
  void initState() {
// TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // int currentIndex = 0;
  // @override
  // void initState() {
  //   controller.addListener(() {
  //     setState(() {
  //       currentIndex = controller.page.toInt();
  //     });
  //   });
  //   super.initState();
  // }

  @override
  Widget itemTab(String btn) {
    return Column(
      children: <Widget>[
        Text(
          'Adresse Email',
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 1.3,
          child: TextField(),
        ),
        SizedBox(height: 50),
        Text(
          'Mot de passe',
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 1.3,
          child: TextField(),
        ),
        SizedBox(height: 40),
        Text(
          'Mot de passe oublié ?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(239, 46, 41, 1),
          ),
        ),
        SizedBox(height: 50),
        Container(
          width: MediaQuery.of(context).size.width / 1.3,
          height: 60,
          decoration: BoxDecoration(
            color: Color.fromRGBO(239, 46, 41, 1),
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: Text(btn, style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    var settings = ScreenSettings(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Column(
          children: <Widget>[
            Container(
              height: settings.height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 6),
                    blurRadius: 10,
                    color: Colors.grey[300],
                  ),
                ],
              ),
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 40),
                    Container(
                      height: 200,
                      padding: EdgeInsets.all(10),
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/ui22ok.png'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: TabBar(
                        tabs: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: new Text(
                              'Connexion',
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: new Text(
                              'Inscription',
                            ),
                          ),
                        ],
                        unselectedLabelColor: const Color(0xffacb3bf),
                        indicatorColor: Color.fromRGBO(239, 46, 41, 1),
                        labelColor: Colors.black,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorWeight: 1,
                        indicatorPadding: EdgeInsets.all(10),
                        controller: _tabController,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  itemTab('connexion'),
                  itemTab('inscription'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
