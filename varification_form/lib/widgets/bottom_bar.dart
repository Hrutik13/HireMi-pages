import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _selectedIndex = 0; // Track the selected index

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: MediaQuery.of(context).size.width * 0.03,
        bottom: MediaQuery.of(context).size.height * 0.03,
        left: MediaQuery.of(context).size.width * 0.03,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white, // Background color for the navigation bar
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 3), // Shadow position
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBottomBarItem(
              context: context,
              icon: Icons.home,
              title: "Home",
              index: 0, // Assign an index for the item
              onTap: () {
                setState(() {
                  _selectedIndex = 0; // Update the selected index
                });
              },
            ),
            _buildBottomBarItem(
              context: context,
              icon: Icons.wallet_travel,
              title: "Job",
              index: 1,
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),
            _buildBottomBarItem(
              context: context,
              svgAsset: "assets/icons/ask_expert.svg",
              title: "Ask Expert",
              index: 2,
              onTap: () {
                setState(() {
                  _selectedIndex = 2;
                });
              },
            ),
            _buildBottomBarItem(
              context: context,
              icon: Icons.list_alt,
              title: "Profile",
              index: 3,
              onTap: () {
                setState(() {
                  _selectedIndex = 3;
                });
              },
            ),
            GestureDetector(
              onTap: () {
                setState(() {

                });
              },
              child: Image.asset(
                'assets/images/hiremi.png',
                height: MediaQuery.of(context).size.height * 0.055,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildBottomBarItem({
    required BuildContext context,
    IconData? icon,
    String? svgAsset,
    required String title,
    required VoidCallback onTap,
    required int index,
  }) {
    bool isSelected = _selectedIndex == index; // Check if the item is selected

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // If svgAsset is provided, use SvgPicture; if imageAsset is provided, use Image.asset
          if (svgAsset != null)
            SvgPicture.asset(
              svgAsset,
              height: MediaQuery.of(context).size.height * 0.03,
              color: isSelected ? const Color(0xFF0F3CC9) : Colors.black54,
            )
          else if (icon != null) // Fallback to Icon if no SVG or Image
            Icon(
              icon,
              color: isSelected ? const Color(0xFF0F3CC9): Colors.black54, // Change color based on selection
              size: MediaQuery.of(context).size.height * 0.03,
            ),
          Text(
            title,
            style: GoogleFonts.poppins(
              color: isSelected ? const Color(0xFF0F3CC9): Colors.black54, // Change text color based on selection
              fontSize: MediaQuery.of(context).size.width * 0.03,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
