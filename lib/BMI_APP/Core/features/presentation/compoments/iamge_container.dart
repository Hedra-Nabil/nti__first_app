
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nti__first_app/BMI_APP/Core/features/presentation/compoments/theme/app_color.dart';

class IamgeContainer extends StatelessWidget {
  const IamgeContainer({
    super.key,
    required this.genderSelection,
    required this.path, required this.value,
  });

  final String genderSelection;
  final String value;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: genderSelection == value
                ? AppColor.purple
                : Colors.transparent),
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SvgPicture.asset(path),
      ),
    );
  }
}