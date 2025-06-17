import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nti__first_app/BMI_APP/Core/features/presentation/compoments/constants/app_image.dart';
import 'package:nti__first_app/BMI_APP/Core/features/presentation/compoments/theme/app_color.dart';
import 'package:nti__first_app/main.dart';

class BmiResult extends StatelessWidget {
  final double height;
  final double weight;
  final String gender;
  final String name;
  final double? bmi;

  const BmiResult({
    super.key,
    required this.height,
    required this.weight,
    required this.gender,
    required this.name,
    this.bmi,
  });

  @override
  Widget build(BuildContext context) {
    

    double calculatedBmi = bmi ?? (weight / ((height / 100) * (height / 100)));
    String bmiStatus;
    String bmiAdvice;

    if (calculatedBmi < 18.5) {
      bmiStatus = "Underweight";
      bmiAdvice =
          "Your BMI is less than 18.5. You should consider eating a balanced diet and consulting with a healthcare professional.";
    } else if (calculatedBmi >= 18.5 && calculatedBmi < 25) {
      bmiStatus = "Normal";
      bmiAdvice = "Your BMI is normal. Keep maintaining a healthy lifestyle!";
    } else if (calculatedBmi >= 25 && calculatedBmi < 30) {
      bmiStatus = "Overweight";
      bmiAdvice =
          "Your BMI is slightly high. Consider regular exercise and a balanced diet.";
    } else {
      bmiStatus = "Obese";
      bmiAdvice =
          "Your BMI indicates obesity. It's recommended to consult a doctor for proper guidance.";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
        centerTitle: true,
        backgroundColor: AppColor.purpl2,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.sizeOf(context).height * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.purpl2,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name, // استخدم الاسم مباشرة
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 30,
                              color: AppColor.white,
                            ),
                          ),
                          Text(
                            gender.toUpperCase(),
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: AppColor.white,
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            calculatedBmi.toStringAsFixed(1),
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 30,
                              color: AppColor.white,
                            ),
                          ),
                          Text(
                            'BMI Value',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: AppColor.white,
                            ),
                          ),
                          SizedBox(height: 30),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    '${height.toInt()} cm',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24,
                                      color: AppColor.white,
                                    ),
                                  ),
                                  Text(
                                    'Height',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                      color: AppColor.white,
                                    ),
                                  ),
                                ],
                              ),
                              VerticalDivider(
                                color: Colors.white,
                                thickness: 2,
                                width: 40,
                              ),
                              Column(
                                children: [
                                  Text(
                                    '${weight.toInt()} kg',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24,
                                      color: AppColor.white,
                                    ),
                                  ),
                                  Text(
                                    'Weight',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                      color: AppColor.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SvgPicture.asset(AppImage.body),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 9, 111, 61),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bmiStatus,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                      color: AppColor.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Your BMI is ${calculatedBmi.toStringAsFixed(1)}',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: AppColor.white,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    bmiAdvice,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColor.white,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: AppColor.purpl2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Back to Home',
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
