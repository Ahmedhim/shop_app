import 'package:flutter/material.dart';
import 'package:shop_app/Models/CatageoryModel.dart';

Widget CategoriesItem(CategoryDataDetails model)=>Stack(alignment: Alignment.bottomLeft,
  children: [
    Image(
      image: NetworkImage(
          model.image),
      height: 100,
      width: 100,
    ),
    Container(color: Colors.black.withOpacity(.7),width: 100,
        child: Text(model.name,style: const TextStyle(color: Colors.white),textAlign:TextAlign.center ,))
  ],
);