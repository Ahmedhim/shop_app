import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Cubits/SearchCubit/SearchCubit.dart';
import 'package:shop_app/Customs/CustomTextField.dart';
import 'package:shop_app/Models/SearchModel.dart';

import '../Cubits/SearchCubit/SearchCubitState.dart';
import '../Cubits/ShopCubit/ShopCubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  final String id = "SearchScreen";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                CustomFormTextField(
                  obsecure: false,
                  onchanged: (String text) {
                    BlocProvider.of<SearchCubit>(context)
                        .Search(productName: text);
                  },
                  label: "Search",
                  keyboard: TextInputType.text,
                ),
                const  SizedBox(height: 10,),
                if (state is SearchLoadingState)
                  const LinearProgressIndicator(color: Colors.black,backgroundColor: Colors.white),
                if (state is SearchSuccessState)
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => SearchBody(
                            BlocProvider.of<SearchCubit>(context)
                                .searchModel!
                                .data
                                .datalist[index],
                            context),
                        separatorBuilder: (context, index) => Container(
                              color: Colors.grey[300],
                              height: 1,
                              width: double.infinity,
                            ),
                        itemCount: BlocProvider.of<SearchCubit>(context)
                            .searchModel!
                            .data
                            .datalist
                            .length),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget SearchBody(DeepData model, context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(children: [
        Image.network(
          model.image,
          height: 115,
          width: 100,
        ),
      const  Spacer(),
        GestureDetector(
          onTap: () {},
          child:  Container(
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
                          style: const TextStyle(color: Colors.black),
                        ),
                        IconButton(
                          onPressed: () {
                          },
                          icon:const Icon(
                            Icons.favorite,
                            color:
                                 Colors.grey,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
