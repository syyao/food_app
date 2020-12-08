import 'package:flutter/material.dart';

Widget mainDrawer(BuildContext context) {
  Widget itemdrawer(IconData icon, String title, String routeName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(routeName);
        },
        child: Container(
          child: Row(
            children: <Widget>[
              Icon(icon, color: Colors.white),
              SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  return Drawer(
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 50, horizontal: 40),
      color: Color.fromRGBO(239, 46, 41, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          itemdrawer(Icons.account_circle, 'profile', 'profil'),
          Divider(color: Colors.white, thickness: 0.2),
          itemdrawer(Icons.shopping_cart, 'orders', 'cart'),
          Divider(color: Colors.white, thickness: 0.2),
          itemdrawer(Icons.style, 'offers and promo', 'OffersAndPromo'),
          Divider(color: Colors.white, thickness: 0.2),
          itemdrawer(Icons.textsms, 'privacy policy', 'privacy'),
          Divider(
            color: Colors.white,
            thickness: 0.2,
          ),
          itemdrawer(Icons.security, 'security', 'Security'),
          Divider(color: Colors.white, thickness: 0.2),
          itemdrawer(Icons.textsms, 'Food_detail', 'detail'),
          SizedBox(height: 150),
          Divider(
            color: Colors.white,
            thickness: 0.2,
          ),
          Row(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('auth');
                },
                child: Text(
                  'Sign-out',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Icon(Icons.arrow_forward, color: Colors.white),
            ],
          )
        ],
      ),
    ),
  );
}
