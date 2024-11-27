

import 'package:flutter/material.dart';
import 'package:hiremi_dashboard/colors.dart';
import '../widgets/slider_widget.dart';
import '../widgets/feature_cards_widget.dart';
import '../widgets/job_recommendation_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/app_drawer.dart';
import '../widgets/popup_msg.dart';
import '../screens/help_and_support.dart';
import '../widgets/custome_BottomBar.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery
            .of(context)
            .size
            .height * 0.25),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
          child: AppBar(
            backgroundColor: const Color(0xFF0F3CC9),
            title: Image.asset(
              'assets/images/main (1).png',
              height: 35,
              color: Colors.white,
            ),
            centerTitle: true,
            iconTheme: const IconThemeData(color: Colors.white),
            actions: [
              Padding(
                padding: EdgeInsets.all(MediaQuery
                    .of(context)
                    .size
                    .width * 0.02),
                child: Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.05,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.1,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HelpAndSupport()),
                      );
                    },
                    icon: const Icon(
                      Icons.notifications_none_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
            flexibleSpace: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery
                          .of(context)
                          .size
                          .height * 0.05,
                      bottom: MediaQuery
                          .of(context)
                          .size
                          .height * 0.02,
                    ),
                    child: Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.15,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                            child: Text(
                              'Verify Your Account Today!',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: MediaQuery.of(context).size.width * 0.03,
                              ),
                            ),
                          ),

                          _buildStepsWithProgress(context, MediaQuery.of(context).size.width * 0.5),

                          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: ElevatedButton(
                              onPressed: () {
                                showCustomPopup(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: MediaQuery.of(context).size.width * 0.04,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.verified,
                                    color: AppColors.drawerIcon,
                                    size: MediaQuery.of(context).size.width * 0.04,
                                  ),
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                                  Text(
                                    'Get Verified >',
                                    style: GoogleFonts.poppins(
                                      color: const Color(0xFF0F3CC9),
                                      fontWeight: FontWeight.w400,
                                      fontSize: MediaQuery.of(context).size.width * 0.04,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SliderWidget(),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.02,
                left: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Hire mi Features',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const FeatureCardsWidget(),
            const JobRecommendationsWidget(),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }

  //code for the progress steps

  Widget _buildStepsWithProgress(BuildContext context,
      double progressLineWidth) {
    int numberOfSteps = 4; // Total steps
    double segmentWidth = progressLineWidth /
        (numberOfSteps - 1); // Dynamic width for each segment

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            // Progress lines between the steps
            Positioned(
              top: MediaQuery.of(context).size.height * 0.015, // Responsive positioning
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  numberOfSteps - 1,
                      (index) =>
                      Container(
                        height: MediaQuery.of(context).size.height * 0.002, // Responsive height
                        width: segmentWidth,
                        color: Colors.blueAccent,
                      ),
                ),
              ),
            ),
            // Steps
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStep(context, "Complete\nProfile", true, 1),
                _buildStep(context, "Verification\nPayment", false, 2),
                _buildStep(context, "Wait for\nVerification", false, 3),
                _buildStep(context, "Get Lifetime\nAccess", false, 4),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStep(BuildContext context, String title, bool isCompleted,
      int stepNumber) {
    return Column(
      children: [
        CircleAvatar(
          radius: MediaQuery.of(context).size.width * 0.03,
          backgroundColor: isCompleted ? Colors.blue[900] : Colors.white,
          child: isCompleted
              ? Icon(
            Icons.check,
            color: Colors.white,
            size: MediaQuery.of(context).size.width * 0.04,
          )
              : Text(
            "$stepNumber",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width * 0.03, // Responsive font size
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.003), // Responsive spacing
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width * 0.02, // Responsive font size
          ),
        ),
      ],
    );
  }
}
