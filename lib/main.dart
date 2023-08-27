import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Api/SharedPrefference.dart';
import 'package:shop_app/Cubits/ShopCubit/ShopCubit.dart';
import 'package:shop_app/views/CatageoryScreen.dart';
import 'package:shop_app/views/FavouriteScreen.dart';
import 'package:shop_app/views/LoginScreen.dart';
import 'package:shop_app/views/HomeScreen.dart';
import 'package:shop_app/views/ProductScreen.dart';
import 'package:shop_app/views/RegisterScreen.dart';
import 'package:shop_app/views/SearchScreen.dart';
import 'package:shop_app/views/SettingsScreen.dart';
import 'package:shop_app/views/onBoardingScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preference.init();
  var onBoarding = Preference.getData(key: "onBoarding");
late  var token;
 token = Preference.getData(key: "token");
 print(token);

  late Widget widget;

  if (onBoarding != null) {
    if (token != null) {
      widget =  HomePage();
    } else if(token==null) {
      widget = const LoginScreen();
    }
  } else if(onBoarding==null) {
    widget =  BoardingScreen();
  }

  runApp(ShopApp(
    widget: widget,
    token: token,
  ));
}

class ShopApp extends StatelessWidget {
  const ShopApp({
    super.key,
    required this.widget, required this.token,
  });
  final Widget widget;
final dynamic token;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShopCubit()
            ..GetHomeData( )
            ..GetCatageory()..GetFavourite()..GetProfile(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.white,
            iconTheme: IconThemeData(
              color: Colors.black
            ),
            elevation: 0,
          ),
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: widget,
        routes: {
          const LoginScreen().id: (context) => const LoginScreen(),
          const SearchScreen().id:(context) => const SearchScreen(),
          const RegisterScreen().id: (context) => const RegisterScreen(),
          const HomePage().id: (context) => const HomePage(),
          const CatageoryScreen().id: (context) => const CatageoryScreen(),
          const FavouriteScreen().id: (context) => const FavouriteScreen(),
          const SettingScreen().id: (context) => const SettingScreen(),
          const ProductScreen().id: (context) => const ProductScreen(),
        },
        initialRoute: const BoardingScreen().id,
      ),
    );
  }
}
