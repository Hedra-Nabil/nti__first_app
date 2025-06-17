part of 'bmi_calc_cubit_cubit.dart';

sealed class BmiCalcCubitState extends Equatable {
  const BmiCalcCubitState();

  @override
  List<Object> get props => [];
}

final class BmiCalcCubitInitial extends BmiCalcCubitState {}

final class BmiCalcSuccess extends BmiCalcCubitState {
  final double bmi;
  final String name;
  final String gender;

  const BmiCalcSuccess({
    required this.bmi,
    required this.name,
    required this.gender,
  });

  @override
  List<Object> get props => [bmi, name, gender];
}
