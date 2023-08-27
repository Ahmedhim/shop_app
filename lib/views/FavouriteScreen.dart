import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Cubits/ShopCubit/ShopCubit.dart';
import 'package:shop_app/Cubits/ShopCubit/ShopCubitState.dart';

import '../Models/GetFavouriteModel.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});
  final id = "FavouriteScreen";
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopCubitState>(
      listener: (context, state) {

      },
      builder: (context, state) => Scaffold(
        body: ConditionalBuilder(
          builder:(context) =>  ListView.separated(
              itemBuilder: (context, index) => CustomCardFavourite(
                  model: BlocProvider.of<ShopCubit>(context)
                      .getFavouriteModel!
                      .data
                      .data[index]
                      .product,context: context),
              separatorBuilder: (context, index) => Container(  color: Colors.grey[300],
                height: 1,
                width: double.infinity,),
              itemCount: BlocProvider.of<ShopCubit>(context).getFavouriteModel!.data.data.length),
          fallback: (context) => const Center(child: CircularProgressIndicator(
            color: Colors.black,
          )),
          condition:state is! ShopGetFavouriteLoading ,
        ),
      ),
    );
  }
}

Widget CustomCardFavourite({required Product model, context}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
        Image.network(
          model.image,
          height: 115,
          width: 100,
        ),
          Spacer(),
          GestureDetector(
            onTap: () {},
            child: Stack(
              children: [
                Container(
                  height: 150,
                  width: 200,
                  child: Card(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      decoration: TextDecoration.lineThrough),
                                ),
                              IconButton(
                                onPressed: () {
                                  BlocProvider.of<ShopCubit>(context).AddFavourite(
                                    model.id,);
                                  BlocProvider.of<ShopCubit>(context).GetFavourite();
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: BlocProvider.of<ShopCubit>(context)
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
                    margin: const EdgeInsets.only(top: 50, right: 10, left: 10),
                    child: const Text("Discount",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                  ),
              ],
            ),
          ),

  ]),
    );
