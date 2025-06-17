import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nti__first_app/BMI_APP/Core/features/presentation/Ui_srcreen/bmi_home_screen.dart';
import 'package:nti__first_app/BMI_APP/Core/features/presentation/compoments/constants/app_image.dart';
import 'package:nti__first_app/BMI_APP/Core/features/presentation/compoments/theme/app_color.dart';
import 'package:nti__first_app/BMI_APP/Core/features/presentation/controllers/cubit/bmi_calc_cubit_cubit.dart';

class BmiWelcomeScreen extends StatelessWidget {
  const BmiWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8F0FE),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'BMI NTI APP',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.37,
                decoration: BoxDecoration(
                  color: AppColor.purpl2,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      Text(
                        'Know Your Body Better,\nGet Your BMI Score in Less\nThan a Minute!',
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'It takes just 30 seconds - and your health is\nworth it!',
                        style: TextStyle(
                          color: AppColor.white.withOpacity(0.9),
                          fontSize: 16,
                          height: 1.4,
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: AppColor.white.withOpacity(0.3),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) => BmiCalcCubitCubit(),
                                child: BmiHomeScreen(),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 18),
                          decoration: BoxDecoration(
                            color: Color(0xFF4A3F8A),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              'Get Start',
                              style: TextStyle(
                                color: AppColor.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.8,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: SvgPicture.asset(
                    AppImage.firstImg,
                    height: MediaQuery.of(context).size.height * 0.9,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
