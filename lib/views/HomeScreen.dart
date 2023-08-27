import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Cubits/ShopCubit/ShopCubit.dart';
import 'package:shop_app/views/SearchScreen.dart';

import '../Cubits/ShopCubit/ShopCubitState.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
final id="HomePage";
  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<ShopCubit,ShopCubitState>(
        listener: (context, state) {

        },
        builder: (context, state) =>  Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Store",style: TextStyle(color: Colors.black, fontWeight:FontWeight.bold),),
            actions: [IconButton(onPressed: () {
              Navigator.pushNamed(context,const SearchScreen().id);
            }, icon:const  Icon(Icons.search,color: Colors.black,size: 30,))],
          ),
          body: BlocProvider.of<ShopCubit>(context).bottomScreens[BlocProvider.of<ShopCubit>(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex:BlocProvider.of<ShopCubit>(context).currentIndex,
            onTap: (index) {
              BlocProvider.of<ShopCubit>(context).ChangeBottom(index);
             BlocProvider.of<ShopCubit>(context).GetFavourite();
            },
            unselectedLabelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            backgroundColor:  Colors.black,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
           selectedItemColor: Colors.black,
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            selectedLabelStyle: const TextStyle(color: Colors.black, fontSize: 14),

            items:const [
              BottomNavigationBarItem(
                icon:  Icon(Icons.home,),
                label: "Products",

              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category,),
                  label: "catageory"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite,),
                  label: "favourite"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings,),
                  label: "settings"
              ),
            ],
          ),

        ),
      );}

  }

