import 'package:flutter/material.dart';

class Categorie {
  final String id;
  final String titre;

  const Categorie({
    @required this.id,
    @required this.titre,
  });
}

class ModelPlats {
  final String id;
  final String idCategorie;
  final String titre;
  final String sousTitre;
  final String price;
  final String image;
  // final bool isfavorite = false;
  const ModelPlats({
    @required this.id,
    @required this.idCategorie,
    @required this.titre,
    @required this.sousTitre,
    @required this.price,
    @required this.image,
  });
}
