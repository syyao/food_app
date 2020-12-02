import 'package:flutter/material.dart';

class OffersAndPromo extends StatefulWidget {
  @override
  _OffersAndPromoState createState() => _OffersAndPromoState();
}

class _OffersAndPromoState extends State<OffersAndPromo> {
  @override
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

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Offers & promo',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                foodMenu('images/food.png'),
                                SizedBox(height: 50),
                                foodMenu('images/food.png'),
                                SizedBox(height: 50),
                                foodMenu('images/food.png'),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                SizedBox(height: 50),
                                foodMenu('images/food1.png'),
                                SizedBox(height: 50),
                                foodMenu('images/food1.png'),
                                SizedBox(height: 50),
                                foodMenu('images/food1.png'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
