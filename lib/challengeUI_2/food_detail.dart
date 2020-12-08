import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_app/challengeUI_2/pageHom.dart';

class FooDetail extends StatefulWidget {
  final String sousTitre;
  final String image;
  FooDetail(this.sousTitre, this.image);
  @override
  _FooDetailState createState() => _FooDetailState();
}

class _FooDetailState extends State<FooDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                Text(
                  'Menu',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              child: Text(
                widget.sousTitre,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    onPressed: null)
              ],
            ),
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                  border: Border.all(width: 5, color: Colors.blue[50]),
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage(widget.image))),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(239, 46, 41, 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: ListView(
                padding: EdgeInsets.only(left: 20),
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Ingredients',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Écraser les bananes cuites à l’aide d’une fourchette ou passer les à la blondeur.Porter l’eau a ébullition, puis réduire le feu et ajoutez y la semoule petit à petit tout en mélangeant à l’aide d’une cuillère en bois.Lorsque vous commencer à obtenir une pâte, ajoutez y les bananes écrasées et continuez à mélanger jusqu’à ce que la pâte devienne bien ferme et lisse.Maintenant faites vos boules de foufou à l’aide d’un petit bol et servez avec votre sauce.Bon Appétit!",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ))
          ]),
        ),
      ),
      floatingActionButton: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          width: MediaQuery.of(context).size.width / 2.9,
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.restaurant,
                color: Color.fromRGBO(239, 46, 41, 1),
              ),
              Text(
                'Commander',
                style: TextStyle(
                  color: Color.fromRGBO(239, 46, 41, 1),
                ),
              )
            ],
          )),
    );
  }
}
