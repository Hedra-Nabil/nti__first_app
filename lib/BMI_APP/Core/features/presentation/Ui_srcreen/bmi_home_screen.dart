import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti__first_app/BMI_APP/Core/features/presentation/Ui_srcreen/bmi_result.dart';
import 'package:nti__first_app/BMI_APP/Core/features/presentation/compoments/cutsom_text_field.dart';
import 'package:nti__first_app/BMI_APP/Core/features/presentation/compoments/iamge_container.dart';
import 'package:nti__first_app/BMI_APP/Core/features/presentation/compoments/constants/app_image.dart';
import 'package:nti__first_app/BMI_APP/Core/features/presentation/compoments/theme/app_color.dart';
import 'package:nti__first_app/BMI_APP/Core/features/presentation/controllers/git_bmi/cubit/bmi_result_cubit.dart';
import 'package:nti__first_app/BMI_APP/Core/features/presentation/controllers/git_bmi/cubit/bmi_result_state.dart';

class BmiHomeScreen extends StatefulWidget {
  const BmiHomeScreen({super.key});

  @override
  State<BmiHomeScreen> createState() => _BmiHomeScreenState();
}

class _BmiHomeScreenState extends State<BmiHomeScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  String genderSelection = '';

  @override
  void dispose() {
    nameController.dispose();
    birthDateController.dispose();
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  void _incrementHeight() {
    if (heightController.text.isNotEmpty) {
      int value = int.parse(heightController.text);
      heightController.text = (value + 1).toString();
      setState(() {});
    } else {
      heightController.text = '1';
      setState(() {});
    }
  }

  void _decrementHeight() {
    if (heightController.text.isNotEmpty) {
      int value = int.parse(heightController.text);
      if (value > 1) {
        heightController.text = (value - 1).toString();
        setState(() {});
      }
    }
  }

  void _incrementWeight() {
    if (weightController.text.isNotEmpty) {
      int value = int.parse(weightController.text);
      weightController.text = (value + 1).toString();
      setState(() {});
    } else {
      weightController.text = '1';
      setState(() {});
    }
  }

  void _decrementWeight() {
    if (weightController.text.isNotEmpty) {
      int value = int.parse(weightController.text);
      if (value > 1) {
        weightController.text = (value - 1).toString();
        setState(() {});
      }
    }
  }

  void _calculateBMI() {
    String errorMessage = '';

    if (genderSelection.isEmpty) {
      errorMessage = 'Please select your gender';
    } else if (!_formKey.currentState!.validate()) {
      return;
    }

    if (errorMessage.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
      );
      return;
    }

    String userName = nameController.text.trim();
    context.read<BmiResultCubit>().getBmiRes(
      height: heightController.text,
      weight: weightController.text,
      unit: 'metric',
      gender: genderSelection,
      name: userName.isEmpty ? 'User' : userName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BmiResultCubit, BmiResultState>(
      listener: (context, state) {
        if (state is BmiResSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => BmiResult(
                    bmiModel: state.bmiModel,
                    gender: state.gender,
                    name: state.name,
                  ),
            ),
          );
        } else if (state is BmiResError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'B M I',
            style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
          backgroundColor: AppColor.lightBlue,
        ),
        body: Form(
          key: _formKey,
          child: BlocBuilder<BmiResultCubit, BmiResultState>(
            builder: (context, state) {
              return SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        SizedBox(height: 35),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [Text('Name')],
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColor.lightBlue2,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(children: [Text('Birth Date')]),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: birthDateController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColor.lightBlue2,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              'Choose Gender',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildGenderSelection(
                              imagePath: AppImage.maleImage,
                              gender: 'male',
                              label: 'Male',
                            ),
                            SizedBox(width: 60),
                            _buildGenderSelection(
                              imagePath: AppImage.femaleImage,
                              gender: 'female',
                              label: 'Female',
                            ),
                          ],
                        ),
                        SizedBox(height: 21),
                        Row(
                          children: [
                            Text(
                              'Your Height(cm)',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        _buildNumberField(
                          controller: heightController,
                          onIncrement: _incrementHeight,
                          onDecrement: _decrementHeight,
                        ),
                        SizedBox(height: 21),
                        Row(
                          children: [
                            Text(
                              'Your Weight(kg)',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        _buildNumberField(
                          controller: weightController,
                          onIncrement: _incrementWeight,
                          onDecrement: _decrementWeight,
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: state is BmiResLoading ? null : _calculateBMI,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  state is BmiResLoading
                                      ? Colors.grey
                                      : AppColor.purpl2,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (state is BmiResLoading)
                                  CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      AppColor.white,
                                    ),
                                  )
                                else
                                  Text(
                                    'Calculate BMI',
                                    style: TextStyle(
                                      color: AppColor.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 90),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildGenderSelection({
    required String imagePath,
    required String gender,
    required String label,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              genderSelection = gender;
            });
          },
          child: IamgeContainer(
            genderSelection: genderSelection,
            path: imagePath,
            value: gender,
          ),
        ),
        SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildNumberField({
    required TextEditingController controller,
    required VoidCallback onIncrement,
    required VoidCallback onDecrement,
  }) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.lightBlue2,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide.none,
        ),
        prefixIcon: GestureDetector(
          onTap: onDecrement,
          child: Icon(Icons.remove),
        ),
        suffixIcon: GestureDetector(onTap: onIncrement, child: Icon(Icons.add)),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'This field is required';
        }
        double? number = double.tryParse(value.trim());
        if (number == null) {
          return 'Please enter a valid number';
        }
        return null;
      },
    );
  }
}
