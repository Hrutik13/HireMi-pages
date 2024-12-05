import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/appBar.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/circularProgressBar.dart';
import '../widgets/career_card.dart';
import '../screens/personal_details.dart';
import '../widgets/divider_line.dart';
import '../widgets/button.dart';

class SelectBackgroundPage extends StatefulWidget {
  const SelectBackgroundPage({super.key});

  @override
  _SelectBackgroundPageState createState() => _SelectBackgroundPageState();
}

class _SelectBackgroundPageState extends State<SelectBackgroundPage> {
  int _selectedIndex = -1; // Initially no card is selected

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: customAppBar(context, 'Select Background'),
      bottomNavigationBar: CustomBottomBar(),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.23,
              child: CircularBar(progress: 25),
            ),
        
           horizontalLine(context), // divider line between progress bar and career stages
        
            SizedBox(height: height * 0.02),
            Padding(
              padding: EdgeInsets.only(left: width * 0.06),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Choose your career stage',
                  style: GoogleFonts.poppins(
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0F3CC9),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            CareerCard(
              title: 'College Student',
              subtitle: '"I am a student preparing for my career."',
              isSelected: _selectedIndex == 0,
              onTap: () {
                setState(() {
                  _selectedIndex = (_selectedIndex == 0) ? -1 : 0; // Toggle selection
                });
              },
            ),
            SizedBox(height: height * 0.02),
            CareerCard(
              title: 'Fresher',
              subtitle: '"I am a recent graduate exploring opportunities."',
              isSelected: _selectedIndex == 1,
              onTap: () {
                setState(() {
                  _selectedIndex = (_selectedIndex == 1) ? -1 : 1; // Toggle selection
                });
              },
            ),
            SizedBox(height: height * 0.02),
            CareerCard(
              title: 'Experience',
              subtitle: '"I have work experience and want to grow further."',
              isSelected: _selectedIndex == 2,
              onTap: () {
                setState(() {
                  _selectedIndex = (_selectedIndex == 2) ? -1 : 2; // Toggle selection
                });
              },
            ),
            SizedBox(height: height * 0.04),
           button(
               context,
               'Continue',
                   ()=> Navigator.push(context,MaterialPageRoute(builder: (context) => PersonalDetailsScreen(),))
           ),
          ],
        ),
      ),
    );
  }
}
