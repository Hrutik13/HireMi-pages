import 'package:flutter/material.dart';
import '../widgets/slider_widget.dart';
import '../widgets/feature_cards_widget.dart';
import '../widgets/job_recommendation_widget.dart';
import '../widgets/bottom_navbar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/app_drawer.dart';
import '../widgets/popup_msg.dart';
import '../screens/help_and_support.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.25),
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
                padding:  EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.1,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HelpAndSupport(),));
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
                      top: MediaQuery.of(context).size.height * 0.05,
                      bottom: MediaQuery.of(context).size.height * 0.02,
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding:  EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                            child: Text(
                              'Verify Your Account Today!',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize:  MediaQuery.of(context).size.width * 0.03,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildStep("Complete\nProfile", true, 1),
                              _buildStep("Verification\nPayment", false, 2),
                              _buildStep("Wait for\nVerification", false, 3),
                              _buildStep("Get Lifetime\nAccess", false, 4),
                            ],
                          ),
                          SizedBox(height:MediaQuery.of(context).size.height * 0.01,), // Space before the button
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: ElevatedButton(
                              onPressed: () {
                                showCustomPopup(context);
                              },
                              style: ButtonStyle(
                                shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: BorderSide.none, // Remove border
                                  ),
                                ),
                                backgroundColor: WidgetStateProperty.all(Colors.white),
                                padding: WidgetStateProperty.all(
                                     EdgeInsets.symmetric(
                                      horizontal: MediaQuery.of(context).size.width * 0.04,
                                    )
                                ),
                              ),
                              child: Text(
                                'Get Verified >',
                                style: GoogleFonts.poppins(
                                  color: const Color(0xFF0F3CC9),
                                  fontWeight: FontWeight.w400,
                                  fontSize:  MediaQuery.of(context).size.width * 0.04,
                                ),
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
            const SliderWidget(), // Slider with career backup text
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.02,
                left: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('Hire mi Features',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize:  MediaQuery.of(context).size.width * 0.04,
                  fontWeight: FontWeight.w500,
                ),),
              ),
            ),
            const FeatureCardsWidget(), // Feature cards section
            const JobRecommendationsWidget(), // Job recommendations
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBarWidget(), // Bottom navigation bar
    );
  }
}

//this for buiding the steps

Widget _buildStep(String title, bool isCompleted, int stepNumber) {
  return Column(
    children: [
      CircleAvatar(
        radius: 10,
        backgroundColor: isCompleted ? Colors.blue[900] : Colors.white,
        child: isCompleted
            ? const Icon(
          Icons.check,
          color: Colors.white,
          size: 15,
        )
            : Text(
          "$stepNumber", // Dynamically display the step number
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
        ),
      ),
      const SizedBox(height: 2),
      Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 7.0,
        ),
      ),
    ],
  );
}
