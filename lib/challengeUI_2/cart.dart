import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget item(String image) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 1.3,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
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
              ),
              Container(
                  margin: EdgeInsets.only(top: 40),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(239, 46, 41, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Text(
                    '- 1 +',
                    style: TextStyle(color: Colors.white),
                  ))
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
        children: <Widget>[
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Text(
                'Cart',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 50),
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
                        child: Icon(Icons.delete, color: Colors.red),
                      ),
                      child: todo);
                }),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width / 1.3,
        height: 60,
        decoration: BoxDecoration(
          color: Color.fromRGBO(239, 46, 41, 1),
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: Text('Complete order', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
