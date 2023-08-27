import 'package:flutter/material.dart';
import 'package:shop_app/Constant/constant.dart';

class CustomButtom extends StatelessWidget {
const  CustomButtom({required this.text,this.ontab});
 final String? text;
  final VoidCallback?ontab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:ontab,
      child: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.deepPurple[800],
        ),
        child: Center(
          child: Text(
            "$text",
            style:const TextStyle(fontWeight: FontWeight.w600,color: Colors.white),
          ),
        ),
      ),
    );
  }
}
