import 'package:flutter/material.dart';

class Categorie {
  final String id;
  final String titre;
  final List<ModelPlats> listDePLats;

  const Categorie({
    @required this.id,
    @required this.titre,
    @required this.listDePLats,
  });
}

class ModelPlats {
  final String id;
  final String titre;
  final String sousTitre;
  final String price;
  final String image;
  const ModelPlats({
    @required this.id,
    @required this.titre,
    @required this.sousTitre,
    @required this.price,
    @required this.image,
  });
}
