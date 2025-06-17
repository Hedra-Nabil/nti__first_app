import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller; // أضف final هنا
  final String? hintText; // أضف hintText اختياري

  const CustomTextFormField({
    super.key,
    required this.controller, // غير ده
    this.hintText, // أضف ده
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 48,
      decoration: BoxDecoration(
        color: Color(0xFFF5F8FF),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(0, 2),
            blurRadius: 6,
          ),
        ],
      ),
      child: TextFormField(
        controller: controller, // أضف السطر ده - ده المهم!
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFF5F8FF),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: InputBorder.none,
          hintText: hintText ?? 'Enter text', // استخدم hintText المُمرر
          hintStyle: TextStyle(
            color: Colors.grey[400],
          ),
        ),
        style: TextStyle(
          color: Colors.black87,
          fontSize: 16,
        ),
      ),
    );
  }
}
