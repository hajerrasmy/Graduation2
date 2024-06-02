import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/sign_bloc/sign_event.dart';
import '../../../bloc/sign_bloc/sing_cubit.dart';
import '../../../common/custom_button.dart';
import '../../../common/custom_form_field.dart';
import '../login/login.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "RegisterScreen";
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(),
      child: RegisterForm(),
    );
  }
}

class RegisterForm extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/splash Screen.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: BlocListener<RegisterCubit, RegisterState>(
              listener: (context, state) {
                if (state.isSuccess) {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  const SizedBox(height: 150),
                  const Center(
                    child: Text(
                      "Create New Account",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff14376A),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      "Enter your personal information\nto create an account",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<RegisterCubit, RegisterState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          CustomFormField(
                            "Name",
                            Mycontroller: TextEditingController(text: state.name),
                            keyboardType: TextInputType.name,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return "Please enter your name";
                              }
                              return null;
                            },
                            onChanged: (text) => context.read<RegisterCubit>().nameChanged(text),
                          ),
                          CustomFormField(
                            "Email",
                            Mycontroller: TextEditingController(text: state.email),
                            keyboardType: TextInputType.emailAddress,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return "Please enter your email";
                              } else if (!isValidEmail(text)) {
                                return "Invalid email format";
                              }
                              return null;
                            },
                            onChanged: (text) => context.read<RegisterCubit>().emailChanged(text),
                          ),
                          CustomFormField(
                            "Password",
                            Mycontroller: TextEditingController(text: state.password),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return "Please enter password";
                              }
                              if (text.length < 6) {
                                return "Password must be at least 6 characters long";
                              }
                              return null;
                            },
                            onChanged: (text) => context.read<RegisterCubit>().passwordChanged(text),
                          ),
                          CustomFormField(
                            "Confirm Password",
                            Mycontroller: TextEditingController(text: state.confirmPassword),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return "Please enter a password";
                              }
                              if (text.length < 6) {
                                return "Password must be at least 6 characters long";
                              }
                              if (text != state.password) {
                                return "Passwords do not match";
                              }
                              return null;
                            },
                            onChanged: (text) => context.read<RegisterCubit>().confirmPasswordChanged(text),
                          ),
                          const SizedBox(height: 24),
                          CustomButton(
                            text: " Register",
                            color: const Color(0xff1F41BB),
                            textColor: Colors.white,
                            onPressed: () {
                              if (formKey.currentState?.validate() == true) {
                                context.read<RegisterCubit>().submit();
                              }
                            },
                          ),
                          CustomButton(
                            text: "Already have an account",
                            color: Colors.white,
                            textColor: Colors.black,
                            onPressed: () {
                              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                            },
                          ),
                        ],
                      );
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
