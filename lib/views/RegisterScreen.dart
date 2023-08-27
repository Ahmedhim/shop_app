import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Cubits/RegisterCubit/RegisterCubit.dart';
import 'package:shop_app/Cubits/RegisterCubit/RegisterCubitState.dart';
import 'package:shop_app/Customs/CustomButton.dart';
import 'package:shop_app/Customs/CustomTextField.dart';
import 'package:shop_app/views/HomeScreen.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen ({super.key});
  final id = "RegisterScreen";
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email;
  String? password;
  String? name;
  String? phone;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        body: BlocConsumer<RegisterCubit,RegisterCubitState>(
          listener: (context, state) {
            if(state is LoadingRegisterState){

            }
            else if(state is SuccessRegisterState){
              Navigator.pushNamed(context,const HomePage().id);
            }
            else if(state is FailureRegisterState){
              print(state.error);

            }
          },
          builder:(context, state) =>  Form(
            autovalidateMode: autovalidateMode,
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                      width: double.infinity,
                      child: Image(
                        image: AssetImage("lib/Assets/loginPhoto.png"),
                        fit: BoxFit.cover,
                      )),
                  const SizedBox(height: 20),
                  Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.deepPurple[900],
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Create account",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding:  EdgeInsets.only(right: 10),
                        child: Icon(Icons.email),
                      ),
                      SizedBox(
                        width: 300,
                        child: CustomFormTextField(
                          onchanged: (value) {
                            email = value;
                          },
                          keyboard: TextInputType.text,
                          label: "Email",
                          obsecure: false,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding:  EdgeInsets.only(right: 10),
                        child: Icon(Icons.lock),
                      ),
                      SizedBox(
                        width: 300,
                        child: CustomFormTextField(
                          onchanged: (value) {
                            password = value;
                          },
                          keyboard: TextInputType.text,
                          label: "passwoed",
                          obsecure: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding:  EdgeInsets.only(right: 10),
                        child: Icon(Icons.drive_file_rename_outline),
                      ),
                      SizedBox(
                        width: 300,
                        child: CustomFormTextField(
                          onchanged: (value) {
                            name = value;
                          },
                          keyboard: TextInputType.text,
                          label: "name",
                          obsecure: false,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding:  EdgeInsets.only(right: 10),
                        child: Icon(Icons.phone),
                      ),
                      SizedBox(
                        width: 300,
                        child: CustomFormTextField(
                          onchanged: (value) {
                            phone = value;
                          },
                          keyboard: TextInputType.phone,
                          label: "phone",
                          obsecure: false,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ConditionalBuilder(
                    condition: state is! LoadingRegisterState,
                    fallback:(context) => const Center(child: CircularProgressIndicator(
                      color: Colors.deepPurple,
                    )),
                    builder:(context) =>  CustomButtom(
                      text: "Create",
                      ontab: () {
                        if (formkey.currentState!.validate()) {
                          BlocProvider.of<RegisterCubit>(context).userRegister(email: email!, password: password!,name:name! ,Phone:phone! );

                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      },
                    ),
                  ),
                 const SizedBox(height: 5),
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, child:const Text("already have account",style: TextStyle(color: Colors.deepPurple),))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
