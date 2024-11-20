import 'package:flutter/material.dart';
import 'package:hiremi/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ResetButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor:  AppColors.resetBtn,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Text(
            "Reset Password",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            )
          ),
        ),
      ),
    );
  }
}
