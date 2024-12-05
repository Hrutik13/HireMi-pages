import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CareerCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isSelected;
  final Function() onTap;

  const CareerCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ?  Color(0xFF0F3CC9): Colors.grey.withOpacity(0.1),
          ),
          color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.grey.withOpacity(0.1), // Selected card color
          borderRadius: BorderRadius.circular(12.0), // Rounded corners

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: MediaQuery.of(context).size.width * 0.05,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Text(
              subtitle,
              style: GoogleFonts.poppins(
                color: Colors.black54,
                fontWeight: FontWeight.w400,
                fontSize: MediaQuery.of(context).size.width * 0.03,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
