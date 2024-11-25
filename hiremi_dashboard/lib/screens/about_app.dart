import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_bar.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Help & Support"),
      drawer: const AppDrawer(),
      body: Center(
        // Center the entire content
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.center, // Centers vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Centers horizontally
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,  // 40% of screen height
              width: MediaQuery.of(context).size.width * 0.8,
              child: Image.asset(
                'assets/images/Group 288905.png',
              ),
            ),
            //const SizedBox(height: 20), // Space between the image and text
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05, // Adjusted for a balanced layout
              //width: 350,
              child: Image.asset(
                'assets/images/image 61.png',
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
            Container(

              alignment: Alignment.center,
              //padding: const EdgeInsets.symmetric(horizontal: 1), // Adds padding for better appearance
              child: Text(
                'Elevate Your Career, Empower Your Business',
                textAlign: TextAlign.center, // Aligns text within the widget
                style: GoogleFonts.poppins(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54, // Subtle color for text
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              child: Container(

                alignment: Alignment.center,
                //padding: const EdgeInsets.symmetric(horizontal: 1), // Adds padding for better appearance
                child: Text(
                  'Hiremi is a platform designed for business growth, providing recruitment solutions and a hiring platform.',
                  textAlign: TextAlign.center, // Aligns text within the widget
                  style: GoogleFonts.poppins(
                    fontSize: MediaQuery.of(context).size.width * 0.03,
                    fontWeight: FontWeight.w500,
                    color: Colors.black45, // Subtle color for text
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              child: Container(
                alignment: Alignment.center,
                //padding: const EdgeInsets.symmetric(horizontal: 1), // Adds padding for better appearance
                child: Text(
                  'We provide career guidance for college students and graduates, supporting them throughout their journey and helping them achieve their desired career goals. Additionally, we provide internship and job opportunities.',
                  textAlign: TextAlign.center, // Aligns text within the widget
                  style: GoogleFonts.poppins(
                    fontSize: MediaQuery.of(context).size.width * 0.03,
                    fontWeight: FontWeight.w500,
                    color: Colors.black45, // Subtle color for text
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,

              child: GestureDetector(
                onTap: () { },
                child: Text(
                  'Learn More',
                  textAlign: TextAlign.center, // Aligns text within the widget
                  style: GoogleFonts.poppins(
                    fontSize: MediaQuery.of(context).size.width * 0.03,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue,
                  ),
                ),
              ),
            )

          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }
}
