import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Api/SharedPrefference.dart';
import 'package:shop_app/Cubits/ShopCubit/ShopCubit.dart';
import 'package:shop_app/Cubits/ShopCubit/ShopCubitState.dart';
import 'package:shop_app/Models/HomeModel.dart';
import 'package:shop_app/Models/ProfileModel.dart';
import 'package:shop_app/views/LoginScreen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});
  final id = "SettingScreen";
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopCubitState>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: ()async {
                await  Preference.sharedPreferences!.remove("onBoarding");
               await Preference.sharedPreferences!.remove("token");
                Navigator.pushNamed(context, const LoginScreen().id);
              },
              child: const Text("Sign out",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black)),
            )
          ],
        ),
        body: SettingBody(BlocProvider.of<ShopCubit>(context).profileModel),
      ),
    );
  }
}

Widget SettingBody(ProfileModel? model) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        color: Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        shadowColor: Colors.black,
        elevation: 15,
        child: Column(
          children: [
            Spacer(),
            Image(image: NetworkImage(model!.data.image),height: 200,width: 200),
            Spacer(flex: 1,),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person),
                Text(model!.data.id.toString()),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.drive_file_rename_outline),
                Text(model.data.name),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.email),
                Text(model.data.email),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone),
                Text(model.data.phone),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.control_point_sharp),
                Text(model.data.Points.toString()),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.money),
                Text(model.data.credit.toString()),
              ],
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
