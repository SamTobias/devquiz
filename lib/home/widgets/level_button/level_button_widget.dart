import 'package:dev_quiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWidget extends StatelessWidget {
  final String label;
  LevelButtonWidget({Key? key, required this.label}) : assert(["Fácil", "Médio", "Difícil", "Perito"].contains(label)) , super(key: key);

  final config = {
    "Fácil": {
      "color": AppColors.levelButtonFacil,
      "textColor": AppColors.levelButtonTextFacil,
      "borderColor": AppColors.levelButtonBorderFacil
    },
    "Médio": {
      "color": AppColors.levelButtonMedio,
      "textColor": AppColors.levelButtonTextMedio,
      "borderColor": AppColors.levelButtonBorderMedio
    },
    "Difícil": {
      "color": AppColors.levelButtonDificil,
      "textColor": AppColors.levelButtonTextDificil,
      "borderColor": AppColors.levelButtonBorderDificil
    },
    "Perito": {
      "color": AppColors.levelButtonPerito,
      "textColor": AppColors.levelButtonTextPerito,
      "borderColor": AppColors.levelButtonBorderPerito
    },
  };

  Color get color => config[label]!['color']!;
  Color get textColor => config[label]!['textColor']!;
  Color get borderColor => config[label]!['borderColor']!;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.fromBorderSide(BorderSide(color: borderColor)),
        borderRadius: BorderRadius.circular(28)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        child: Text(label, style: GoogleFonts.notoSans(color: textColor, fontSize: 13)),
      ),
    );
  }
}
