import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:nti__first_app/BMI_APP/Core/features/data/model/bmi_data_model.dart';
import 'package:nti__first_app/BMI_APP/Core/features/data/model/bmi_model.dart';
import 'package:nti__first_app/BMI_APP/Core/features/presentation/controllers/git_bmi/cubit/bmi_result_state.dart';

class BmiResultCubit extends Cubit<BmiResultState> {
  BmiResultCubit() : super(BmiResInitial());

  Future<void> getBmiRes({
    required String height,
    required String weight,
    required String unit,
    required String gender,
    required String name,
  }) async {
    try {
      emit(BmiResLoading());

      var dio = Dio();
      dio.options.headers = {
        "x-api-key": "487de323-657a-404b-8d2e-a1ba3d111688",
      };

      var response = await dio.get(
        'https://api.apiverve.com/v1/bmicalculator?weight=$weight&height=$height&unit=$unit',
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData;

        if (response.data is String) {
          jsonData = json.decode(response.data);
        } else if (response.data is Map<String, dynamic>) {
          jsonData = response.data;
        } else {
          emit(BmiResError('Unexpected data type from API'));
          return;
        }

        var model = BmiModel.fromJson(jsonData);

        if (model.status == 'ok' && model.data != null) {
          var bmiData = BmiDataModel.fromJson(model.data!);

          emit(BmiResSuccess(bmiModel: bmiData, gender: gender, name: name));
        } else {
          emit(BmiResError('Failed to get BMI data from server'));
        }
      } else {
        emit(BmiResError('Server error: ${response.statusCode}'));
      }
    } catch (e) {
      emit(BmiResError('Error: $e'));
    }
  }
}
