import 'package:bloc_template/config/color/colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const AppButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }
}
