import 'package:flutter/material.dart';
import 'package:hiremi/colors.dart';

class BackgroundCircle extends StatelessWidget {
  const BackgroundCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -MediaQuery.of(context).size.height * 0.23,
      left: -MediaQuery.of(context).size.width * 0.5,
      right: -MediaQuery.of(context).size.width * 0.5,
      child: Container(
        width: MediaQuery.of(context).size.width * 2,
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: const BoxDecoration(
          color: AppColors.background,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
