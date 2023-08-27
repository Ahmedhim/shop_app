
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Cubits/LoginCubit/LoginCubit.dart';
import 'package:shop_app/Cubits/LoginCubit/LoginCubitState.dart';
import 'package:shop_app/Customs/CustomButton.dart';
import 'package:shop_app/Customs/CustomTextField.dart';
import 'package:shop_app/views/HomeScreen.dart';
import 'package:shop_app/views/RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  final id = "loginScreen";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginCubitState>(
        listener: (context, state) {
          if(state is FailureLoginState){
            print(state.error);
          }
          else if(state is SuccessLoginState){
Navigator.pushNamed(context, const HomePage().id);
          }

        },
        builder:(context, state) =>  Scaffold(
          body: Form(
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
                  const SizedBox(height: 30),
                  Text(
                    "USER LOGIN",
                    style: TextStyle(
                        color: Colors.deepPurple[900],
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Welcome back",
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
                          keyboard: TextInputType.emailAddress,
                          label: "Email",
                          obsecure: false,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
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
                          keyboard: TextInputType.visiblePassword,
                          label: "passwoed",
                          obsecure: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  ConditionalBuilder(
                    condition:state is! LoadingLoginState,
                    builder:(context) =>  CustomButtom(
                      text: "LOGIN",
                      ontab: () {
                        if (formkey.currentState!.validate()) {
BlocProvider.of<LoginCubit>(context).UserLogin(email: email!, password: password!);
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      },
                    ),
                    fallback: (context) => const Center(
                      child:  CircularProgressIndicator(
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                 const SizedBox(height: 10),
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context,const RegisterScreen().id);
                  }, child:const Text("Dont have account",style: TextStyle(color: Colors.deepPurple),))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
