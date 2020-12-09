import 'package:flutter/material.dart';
import 'package:food_app/challengeUI_2/favoritePage.dart';
import 'package:food_app/challengeUI_2/security.dart';
import 'challengeUI_2/authen.dart';
import 'challengeUI_2/bottomNavigator.dart';
import 'challengeUI_2/cart.dart';
import 'challengeUI_2/offers_and_promo.dart';
import 'challengeUI_2/pageHom.dart';
import 'challengeUI_2/privacy_policy.dart';
import 'challengeUI_2/profil.dart';
import 'challengeUI_2/schedule.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BottomNavigator(),
        routes: {
          'pagehom': (context) => PageHom(),
          'cart': (context) => Cart(),
          'auth': (context) => Authen(),
          'favorite': (context) => FavoriteScreen(),
          'profil': (context) => Profil(),
          'schedule': (context) => Schedule(),
          'privacy': (context) => Privacy(),
          'OffersAndPromo': (context) => OffersAndPromo(),
          'Security': (context) => Security(),
        });
  }
}
