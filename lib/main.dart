import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti__first_app/BMI_APP/Core/features/data/model/bmi_data_model.dart';
import 'package:nti__first_app/BMI_APP/Core/features/data/model/bmi_model.dart';
import 'package:nti__first_app/BMI_APP/Core/features/presentation/Ui_srcreen/bmi_welcome_screen.dart';
import 'package:nti__first_app/BMI_APP/Core/features/presentation/controllers/cubit/bmi_calc_cubit_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    getBMIData();
  }

  Future<void> getBMIData() async {
    try {
      var response = await getBMI('54', '170', 'metric');
      if (response != null) {
        Map<String, dynamic> jsonData;

        if (response is String) {
          jsonData = json.decode(response);
        } else if (response is Map<String, dynamic>) {
          jsonData = response;
        } else {
          print('Error ${response.runtimeType}');
          return;
        }

        var model = BmiModel.fromJson(jsonData);

        print('Status: ${model.status}');

        // التحقق من وجود البيانات التفصيلية
        if (model.data != null) {
          // إنشاء كائن BmiDataModel من البيانات التفصيلية
          var bmiData = BmiDataModel.fromJson(model.data!);

          // طباعة البيانات التفصيلية
          print('Height: ${bmiData.height}');
          print('Weight: ${bmiData.weight}');
          print('BMI: ${bmiData.bmi}');
          print('Risk: ${bmiData.risk}');
          print('Summary: ${bmiData.summary}');
          print('Recommendation: ${bmiData.recommendation}');
        } else {
          print('No detailed data available');
        }
      } else {
        print('No response received from API');
      }
    } catch (e) {
      print('Error BMI: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => BmiCalcCubitCubit(),
        child: const BmiWelcomeScreen(),
      ),
    );
  }
}

Future<dynamic> getBMI(String Weight, String Height, String Unit) async {
  String weight = Weight;
  String height = Height;
  String unit = Unit;
  var dio = Dio();
  dio.options.headers = {"x-api-key": "487de323-657a-404b-8d2e-a1ba3d111688"};
  try {
    var response = await dio.get(
      'https://api.apiverve.com/v1/bmicalculator?weight=$weight&height=$height&unit=$unit',
    );
    print(response.data);
    return response.data;
  } catch (e) {
    print('Error fetching BMI data: $e');
    return null;
  }
}
