import 'package:flutter/material.dart';


class CustomFormTextField extends StatelessWidget {
 const CustomFormTextField({this.label,this.keyboard,this.onchanged,this.obsecure=false, this.onssaved}) ;
  final String? label;
 final  TextInputType? keyboard;
final  Function(String)?onchanged;
 final bool obsecure;
final void Function(String?)? onssaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecure,
      onSaved:onssaved ,
      validator: (value) {
        if(value!.isEmpty){
          return"field is required";}
      },
      onChanged:onchanged ,
      decoration: InputDecoration(
        enabledBorder:  const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            )),
        focusedBorder: const OutlineInputBorder( borderSide: BorderSide(color: Colors.grey,)),
        label: Text(
          "$label",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w400,

          ),
        ),),
      keyboardType: keyboard,
    );
  }
}
