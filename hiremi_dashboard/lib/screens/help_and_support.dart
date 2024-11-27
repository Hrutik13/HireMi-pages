import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/app_drawer.dart';
import '../widgets/app_bar.dart';
import '../widgets/custome_BottomBar.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Help & Support"),
      drawer: const AppDrawer(),

      body: Center(
        // Center the entire content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centers vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Centers horizontally
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,  // 30% of screen height
              width: MediaQuery.of(context).size.width * 0.9,
              child: Image.asset(
                'assets/images/help&support.png',
              ),
            ),
             SizedBox(height:  MediaQuery.of(context).size.height * 0.01,), // Space between the image and text
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width * 0.05,), // Adds padding for better appearance
              child: Text(
                'NNN: No New Notifications! Please explore the Hiremi application for a while.',
                textAlign: TextAlign.center, // Aligns text within the widget
                style: GoogleFonts.poppins(
                  fontSize: MediaQuery.of(context).size.height * 0.018,
                  fontWeight: FontWeight.w500,
                  color: Colors.black, // Subtle color for text
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
