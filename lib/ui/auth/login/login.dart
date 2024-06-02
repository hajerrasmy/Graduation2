import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/login_bloc/login_cubit.dart';
import '../../../bloc/login_bloc/login_event.dart';
import '../../../common/custom_button.dart';
import '../../../common/custom_form_field.dart';
import '../../../home_page.dart';
import '../register/Register.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "LoginScreen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.of(context).pushReplacementNamed(MainHomePages.routeName);
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/splash Screen.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  const Center(
                    child: Text(
                      "Login Here",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff14376A),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                    child: Text(
                      "Welcome back you’ve \n\t\t\t  been missed!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormField(
                    "Email",
                    Mycontroller: email,
                  ),
                  CustomFormField(
                    "Password",
                    Mycontroller: password,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    alignment: Alignment.topRight,
                    child: const Text(
                      "Forgot your Password ?",
                      style: TextStyle(
                        color: Color(0xff1F41BB),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return CustomButton(
                        text: "Login",
                        color: const Color(0xff1F41BB),
                        textColor: Colors.white,
                        onPressed: () {
                          final emailText = email.text;
                          final passwordText = password.text;
                          context.read<LoginCubit>().login(emailText, passwordText);
                        },
                      );
                    },
                  ),
                  CustomButton(
                    text: "Create New account",
                    color: Colors.white,
                    textColor: Colors.black,
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(RegisterScreen.routeName);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
