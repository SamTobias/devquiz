import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/home/widgets/chart/chart_widget.dart';
import 'package:flutter/material.dart';

class ScoreCardWidget extends StatelessWidget {
  final double percent;

  const ScoreCardWidget({Key? key, required this.percent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 136,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(20)),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Expanded(flex: 1, child: ChartWidget(percent: .75)),
          Expanded(
              flex: 3,
              child: Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Vamos começar", style: AppTextStyles.heading),
                      Text("Complete os desafios e avance em conhecimento",
                          style: AppTextStyles.body)
                    ],
                  )))
        ]),
      ),
    );
  }
}
