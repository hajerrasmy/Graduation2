import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation3/bloc/age_bloc/age_cubit.dart';
import 'package:graduation3/bloc/age_bloc/age_event.dart';
import 'package:graduation3/bloc/height_bloc/height_cubit.dart';
import 'package:graduation3/bloc/height_bloc/height_event.dart';
import 'package:graduation3/common/intro_widget.dart';
import '../../../bloc/weight_bloc/age_cubit.dart';
import '../../../bloc/weight_bloc/age_event.dart';
import '../../../common/heart_widget.dart';
import '../../../common/spo2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AgeCubit()),
        BlocProvider(create: (_) => WeightCubit()),
        BlocProvider(create: (_) => HeightCubit()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hi, Steven",
                style: TextStyle(color: Colors.black45, fontSize: 18),
              ),
              Text(
                "Smart Mood",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
              IntroWidget("Get Start", "assets/images/Happy Earth.gif", ""),
              const SizedBox(height: 10),
              Text(
                "Activity Status",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              const HeartRateWidget(),
              Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 170,
                        child: Spo2(),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  HeightWidget(),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: AgeWidget(),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: WeightWidget(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
