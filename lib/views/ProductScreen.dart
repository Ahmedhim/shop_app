import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Cubits/LoginCubit/LoginCubit.dart';
import 'package:shop_app/Cubits/ShopCubit/ShopCubit.dart';
import 'package:shop_app/Cubits/ShopCubit/ShopCubitState.dart';
import 'package:shop_app/Models/HomeModel.dart';

import '../Customs/CustomCard.dart';
import '../Customs/CustomCategoryIItem.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});
  final id = "ProductScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ShopCubit, ShopCubitState>(
        listener: (context, state) {},
        builder: (context, state) => ConditionalBuilder(
            condition: BlocProvider.of<ShopCubit>(context).homeModel != null &&
                BlocProvider.of<ShopCubit>(context).model != null,
            builder: (context) =>
                productBuilder(BlocProvider.of<ShopCubit>(context).homeModel!,context),
            fallback: (context) => const Center(
                    child: CircularProgressIndicator(
                  color: Colors.black,
                ))),
      ),
    );
  }
}

Widget productBuilder(HomeModel model,context) =>
       SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
                items: model.data.banners
                    .map((e) => Image(
                          image: NetworkImage("${e.image}"),
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ))
                    .toList(),
                options: CarouselOptions(
                  height: 200.0,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                  viewportFraction: 1.0,
                )),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Categories",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 24)),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 100,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => CategoriesItem(
                            BlocProvider.of<ShopCubit>(context)
                                .model!
                                .data
                                .data[index]),
                        separatorBuilder: (context, index) => const SizedBox(
                              width: 10,
                            ),
                        itemCount: BlocProvider.of<ShopCubit>(context)
                            .model!
                            .data
                            .data
                            .length),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                      height: 30,
                      child: Text(
                        "New Products",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w800),
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 20,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: model.data.products.length,
                itemBuilder: (context, index) => CustomCard(
                    model: BlocProvider.of<ShopCubit>(context)
                        .homeModel!
                        .data
                        .products[index],context: context)),
          ],
        ),
      );

