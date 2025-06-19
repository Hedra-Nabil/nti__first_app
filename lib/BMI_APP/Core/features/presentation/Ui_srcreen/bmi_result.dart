import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nti__first_app/BMI_APP/Core/features/data/model/bmi_data_model.dart';
import 'package:nti__first_app/BMI_APP/Core/features/presentation/compoments/constants/app_image.dart';
import 'package:nti__first_app/BMI_APP/Core/features/presentation/compoments/theme/app_color.dart';
import 'package:nti__first_app/BMI_APP/Core/features/presentation/Ui_srcreen/bmi_home_screen.dart';

class BmiResult extends StatelessWidget {
  final BmiDataModel bmiModel;
  final String gender;
  final String name;

  const BmiResult({
    super.key,
    required this.bmiModel,
    required this.gender,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: AppColor.purpl2,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.sizeOf(context).height * 0.42,
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
                            name,
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 25,
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
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    bmiModel.bmi.toStringAsFixed(1),
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
                                      fontSize: 11,
                                      color: AppColor.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 18),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    bmiModel.height,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: AppColor.white,
                                    ),
                                  ),
                                  Text(
                                    'Height',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: AppColor.white,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 40,
                                child: VerticalDivider(
                                  color: Colors.white,
                                  thickness: 2,
                                  width: 40,
                                ),
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    bmiModel.weight,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: AppColor.white,
                                    ),
                                  ),
                                  Text(
                                    'Weight',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
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
            SizedBox(height: 10),
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
                    'Your Status',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: AppColor.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Your BMI is ${bmiModel.bmi.toStringAsFixed(1)}',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColor.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    bmiModel.risk,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: AppColor.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    bmiModel.summary,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
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
                  MaterialPageRoute(builder: (context) => BmiHomeScreen()),
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
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
