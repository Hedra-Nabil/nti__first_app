import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bmi_calc_cubit_state.dart';

class BmiCalcCubitCubit extends Cubit<BmiCalcCubitState> {
  BmiCalcCubitCubit() : super(BmiCalcCubitInitial());

  void calculateBmi({
    required double height,
    required double weight,
    required String name,
    required String gender,
  }) {
    

    double heightInMeters = height / 100;
    double bmi = weight / (heightInMeters * heightInMeters);

    emit(BmiCalcSuccess(
      bmi: bmi,
      name: name.trim(), 
      gender: gender,
    ));
  }
}
