import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Cubits/ShopCubit/ShopCubit.dart';
import 'package:shop_app/Cubits/ShopCubit/ShopCubitState.dart';
import 'package:shop_app/Models/CatageoryModel.dart';

class CatageoryScreen extends StatelessWidget {
  const CatageoryScreen({super.key});
  final id = "CatageoryScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ShopCubit, ShopCubitState>(
        builder: (context, state) => ListView.separated(
            itemBuilder: (context, index) => CategoriesItems(
                  BlocProvider.of<ShopCubit>(context).model!.data.data[index],
                ),
            separatorBuilder: (context, index) => Container(
                  color: Colors.grey[300],
                  height: 1,
                  width: double.infinity,
                ),
            itemCount:
                BlocProvider.of<ShopCubit>(context).model!.data.data.length),
      ),
    );
  }
}

Widget CategoriesItems(CategoryDataDetails model) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Image(
            image: NetworkImage(model.image),
            width: 100,
            height: 100,
          ),
        const  Spacer(),
          Text(
            model.name,
            style: const TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
