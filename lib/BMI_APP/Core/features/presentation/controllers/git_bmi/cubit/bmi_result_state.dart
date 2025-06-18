import 'package:flutter/material.dart';
import 'package:nti__first_app/BMI_APP/Core/features/data/model/bmi_data_model.dart';

@immutable
sealed class BmiResultState {}

final class BmiResInitial extends BmiResultState {}

class BmiResLoading extends BmiResultState {}

class BmiResError extends BmiResultState {
  final String message;
  BmiResError(this.message);
}

class BmiResSuccess extends BmiResultState {
  final BmiDataModel bmiModel;
  final String gender;
  final String name;

  BmiResSuccess({
    required this.bmiModel,
    required this.gender,
    required this.name,
  });
}
