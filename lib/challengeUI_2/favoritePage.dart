import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget item(String image) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 1.2,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: <Widget>[
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Veggie tomato mix',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '#1.900',
                    style: TextStyle(
                      color: Color.fromRGBO(239, 46, 41, 1),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.favorite, color: Colors.red)
            ],
          ),
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    final todos = <Widget>[
      item('images/food.png'),
      item('images/food1.png'),
      item('images/food1.png'),
    ];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Favorites',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.touch_app, color: Colors.grey),
              Text(
                'swipe on an item to delete',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
                itemCount: todos.length,
                separatorBuilder: (context, i) => SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  return Dismissible(
                      key: Key('$todo$index'),
                      onDismissed: (direction) => todos.removeAt(index),
                      background: Container(
                        padding: const EdgeInsets.only(right: 60),
                        alignment: Alignment.centerRight,
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                      ),
                      child: todo);
                }),
          ),
        ],
      ),
    );
  }
}
