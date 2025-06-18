import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti__first_app/BMI_APP/Core/features/presentation/Ui_srcreen/bmi_welcome_screen.dart';
import 'package:nti__first_app/BMI_APP/Core/features/presentation/controllers/git_bmi/cubit/bmi_result_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BmiResultCubit(),
      child: MaterialApp(
        title: 'BMI Calculator',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const BmiWelcomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
