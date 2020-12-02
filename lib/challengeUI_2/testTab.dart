import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> with TickerProviderStateMixin {
  TabController _tabController;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Container(
          child: Column(
        children: <Widget>[
          Container(
            height: 60,
            margin: EdgeInsets.only(left: 60),
            child: TabBar(
              tabs: [
                Container(
                  width: 70.0,
                  child: new Text(
                    'Tab1',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  width: 75.0,
                  child: new Text(
                    'Tab2',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
              unselectedLabelColor: const Color(0xffacb3bf),
              indicatorColor: Color(0xFFffac81),
              labelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3.0,
              indicatorPadding: EdgeInsets.all(10),
              isScrollable: true,
              controller: _tabController,
            ),
          ),
          Container(
            height: 100,
            child: TabBarView(controller: _tabController, children: <Widget>[
              Container(
                height: 100,
                child: Text("login"),
              ),
              Container(
                height: 100,
                child: Text("sign up"),
              )
            ]),
          )
        ],
      ))
    ]));
  }
}
