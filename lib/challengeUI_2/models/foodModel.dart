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
  final List<String> categories;
  final String titre;
  final String sousTitre;
  final String price;
  const ModelPlats({
    @required this.id,
    @required this.categories,
    @required this.titre,
    @required this.sousTitre,
    @required this.price,
  });
}
