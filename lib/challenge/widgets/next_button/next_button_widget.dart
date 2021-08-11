import 'package:dev_quiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final bool isPrimary;
  final VoidCallback onTap;

  NextButtonWidget(
      {required this.label, this.isPrimary = false, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(8.0),
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(
              isPrimary ? AppColors.green : AppColors.lightGrey),
          backgroundColor: MaterialStateProperty.all(
              isPrimary ? AppColors.darkGreen : AppColors.white),
          side: MaterialStateProperty.all(BorderSide(
              color: isPrimary ? AppColors.green : AppColors.border)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        onPressed: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: isPrimary ? AppColors.white : Colors.black54),
          ),
        ),
      ),
    );
  }
}
