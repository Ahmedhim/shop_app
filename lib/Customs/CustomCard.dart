import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Models/HomeModel.dart';

import '../Api/SharedPrefference.dart';
import '../Cubits/ShopCubit/ShopCubit.dart';

Widget CustomCard({required ProductsModel model, context})=> Stack(clipBehavior: Clip.none, children: [
  GestureDetector(
    onTap: () {},
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.2),
              blurRadius: 50,
              spreadRadius: 0,
              offset: const Offset(10, 10),
            ),
          ]),
          height: 150,
          width: 200,
          child: Card(
            elevation: 10,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 10,
                left: 10,
                bottom: 8,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween,
                    children: [
                      Text(
                        "${model.price}" + r"$",
                        style: TextStyle(color: Colors.black),
                      ),
                      if (model.discount != 0)
                        Text(
                          "${model.oldPrice}" + r"$",
                          style: const TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration
                                  .lineThrough),
                        ),

                      IconButton(
                        onPressed: () {
                          BlocProvider.of<ShopCubit>(context)
                              .AddFavourite(model.id,);
BlocProvider.of<ShopCubit>(context).GetFavourite();
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: BlocProvider
                              .of<ShopCubit>(context)
                              .favourites[model.id]!
                              ? Colors.red
                              : Colors.grey,
                        ),
                      ),

                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        if (model.discount != 0)
          Container(
            padding: const EdgeInsets.all(2),
            color: Colors.red,
            margin: const EdgeInsets.only(
                top: 50, right: 10, left: 10),
            child: const Text("Discount",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
          ),
      ],
    ),
  ),
  Positioned(
    top: -60,
    left: 75,
    child: Image.network(
      model.image,
      height: 115,
      width: 100,
    ),
  ),
]);