import 'package:flutter/material.dart';
import 'package:shop_app/Models/BoardModel.dart';

import '../Constant/constant.dart';

Widget CustomBoardItem ({required BoardModel model})=>Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Center(child: Image(image: AssetImage("${model.image}"))),
    const SizedBox(height: 30,),
    Center(
      child: Text("${model.title}",
          style:  TextStyle(
              fontSize: 32, fontWeight: FontWeight.bold, color: kcolor)),
    ),
    const SizedBox(height: 30),
    Center(
      child: Text("${model.body}",
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.grey)),
    ),
  ],
);
