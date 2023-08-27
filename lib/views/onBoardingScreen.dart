import 'package:flutter/material.dart';
import 'package:shop_app/Api/SharedPrefference.dart';
import 'package:shop_app/Constant/constant.dart';
import 'package:shop_app/Customs/CustomBoardItem.dart';
import 'package:shop_app/views/LoginScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Models/BoardModel.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});
  final id = "BoardingScreen";
  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

List<BoardModel> board = [
  BoardModel("lib/Assets/board1.png", "Online Shopping",
      "proffesnal online shop app for shopping"),
  BoardModel(
      "lib/Assets/board2.png", "Easy Payment", "Easy payment and good support"),
  BoardModel(
      "lib/Assets/board3.png", "Fast Delivery", "fast delivery and safe"),
];
final controller = PageController();

class _BoardingScreenState extends State<BoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        TextButton(
            onPressed: () {
              Preference.saveData(key: "onBoarding", value: true).then((value) {
                if(value){
                Navigator.pushNamed(context, const LoginScreen().id);}
              });
            },
            child: Text(
              "Skip",
              style: TextStyle(
                  color: kcolor, fontWeight: FontWeight.bold, fontSize: 16),
            ))
      ]),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
                child: PageView.builder(
              allowImplicitScrolling: false,
              controller: controller,
              itemBuilder: (context, index) =>
                  CustomBoardItem(model: board[index]),
              itemCount: board.length,
            )),
            SmoothPageIndicator(
              controller: controller,
              count: board.length,
              effect: ExpandingDotsEffect(
                dotColor: Colors.grey,
                activeDotColor: kcolor!,
                dotHeight: 10,
                expansionFactor: 4,
                dotWidth: 10,
                spacing: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
