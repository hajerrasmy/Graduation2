import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation3/bloc/age_bloc/age_cubit.dart';
import 'package:graduation3/ui/auth/login/login.dart';
import 'package:graduation3/ui/auth/register/Register.dart';
import 'package:graduation3/ui/home_page.dart';
import 'package:graduation3/ui/onboarding_screen/onboarding_screen.dart';
import 'package:graduation3/ui/pages/home_pages/home_page.dart';

void main() {
  //configureDependencies();
  runApp(const MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx)=>AgeCubit(),
      child: MaterialApp(
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                color: Colors.transparent,
                shadowColor: Colors.transparent,
                titleTextStyle: TextStyle(fontSize: 16, color: Colors.black)),
            scaffoldBackgroundColor: Colors.transparent,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color(0xff0076CA),
              primary: Color(0xff0076CA),
              secondary: Colors.black,
              onSecondary: Colors.white,
            ),
            useMaterial3: false,
            primaryColor: Color(0xff0076CA)),
        routes: {
          OnboardingScreen.routeName: (_) => const OnboardingScreen(),
          LoginScreen.routeName: (_) => const LoginScreen(),
          RegisterScreen.routeName: (_) => const RegisterScreen(),
          MainHomePages.routeName: (_) => MainHomePages(),
        },
        initialRoute: MainHomePages.routeName,
      ),
    );
  }
}
