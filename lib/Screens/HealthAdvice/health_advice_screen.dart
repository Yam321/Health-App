import 'package:flutter/material.dart';
import 'package:healthapp/Screens/HealthAdvice/Widgets/health_advice_card_widget.dart';

class HealthAdviceScreen extends StatelessWidget {
  const HealthAdviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemCount: 15,
      itemBuilder: (context, index) {
        return HealthAdviceCardWidget();
      },
    );
  }
}
