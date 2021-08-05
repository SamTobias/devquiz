import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final bool isRight;

  const AnswerWidget(
      {Key? key,
      required this.title,
      required this.isSelected,
      required this.isRight})
      : super(key: key);

  Color get _selectedColorRight =>
      isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: isSelected ? _selectedColorCardRight : AppColors.white,
            border: Border.fromBorderSide(BorderSide(
                color:
                    isSelected ? _selectedBorderCardRight : AppColors.border)),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Text(title,
                    style: isSelected
                        ? _selectedTextStyleRight
                        : AppTextStyles.body)),
            Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                    color: isSelected ? _selectedColorRight : AppColors.white,
                    border: Border.fromBorderSide(BorderSide(
                        color: isSelected
                            ? _selectedBorderRight
                            : AppColors.border)),
                    borderRadius: BorderRadius.circular(500)),
                child: isSelected ? Icon(_selectedIconRight, size: 16, color: Colors.white) : null)
          ],
        ),
      ),
    );
  }
}
