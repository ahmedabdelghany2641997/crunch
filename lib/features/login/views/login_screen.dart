import 'dart:math';
import 'package:crunch/features/login/cubit/login_cubit.dart';
import 'package:crunch/features/login/cubit/login_states.dart';
import 'package:crunch/features/login/widgets/custom_button.dart';
import 'package:crunch/features/login/widgets/custom_textformfield.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> key = GlobalKey();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BlocProvider(
        create: (context) => LoginCubit(Dio()),
        child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {
            if (state is SuccessState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Success")));
            }
            if (state is ErrorState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("${e.toString()}")));
            }
          },
          builder: (context, state) {
            return Scaffold(
              body: Form(
                key: key,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: .center,
                      children: [
                        SizedBox(
                          height: 150,
                          width: 150,
                          child: Image.asset("assets/images/photo.jpg"),
                        ),
                        Text(
                          "Login",
                          style: TextStyle(fontSize: 35, fontWeight: .bold),
                        ),
                        SizedBox(height: 15),
                        CustomTextFormField(
                          text: 'Email',
                          lab: Text("Enter Your Email"),
                          prefixIcon: Icon(Icons.email_sharp),
                          controller: emailController,
                          onTap: () {},
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "enter your email";
                            }
                            if (val.length < 6) {
                              return "you must enter more than characters";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 20),
                        CustomTextFormField(
                          text: 'Password',
                          lab: Text("Enter Your Password"),
                          prefixIcon: Icon(Icons.visibility_off),
                          controller: passwordController,
                          onTap: () {},
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "enter your Password";
                            }
                            if (val.length < 6) {
                              return "you must enter more than characters";
                            } else {
                              return null;
                            }
                          },
                        ),

                        SizedBox(height: 15),
                        Align(
                          alignment: .centerRight,
                          child: Text(
                            "Forgot Your Password",
                            style: TextStyle(fontSize: 15, fontWeight: .bold),
                          ),
                        ),
                        state is LoadingState
                            ? Center(child: CircularProgressIndicator())
                            : CustomButton(
                                text: 'Login',
                                onPressed: () {
                                  if (key.currentState!.validate()) {
                                    context.read<LoginCubit>().login(
                                      name: emailController.text,
                                      pass: passwordController.text,
                                    );
                                  }
                                },
                              ),
                        Row(
                          mainAxisAlignment: .center,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 16,
                                ),
                                children: [
                                  TextSpan(text: "Don't Have Any Account? "),
                                  TextSpan(
                                    text: 'Signup',
                                    style: TextStyle(
                                      color: Colors.pinkAccent,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
