import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JobRecommendationsWidget extends StatelessWidget {
  const JobRecommendationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Jobs for you",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            height: 160.0, // Adjusted height for a better Card appearance
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildJobCard("Motion Designer", "Bangalore", "Pinterest, Inc.", "70K/Month"),
                _buildJobCard("Graphic Designer", "Mumbai", "Adobe, Inc.", "60K/Month"),
                _buildJobCard("UI/UX Designer", "Pune", "Google, Inc.", "80K/Month"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJobCard(String jobTitle, String location, String company, String salary) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: const EdgeInsets.only(right: 16.0), // Spacing between cards
      child: Container(
        width: 250.0, // Increased width to fit all details
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0), // Matches Card shape for consistency
          color: Colors.blue.withOpacity(0.1), // Light blue background
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Job Title and Location
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    jobTitle,
                    style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      location,
                      style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            // Company Name
            Text(
              company,
              style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16.0),
            // "Apply Now" Button and Salary
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0F3CC9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  ),
                  child: const Text(
                    "Apply Now",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
                Text(
                  salary,
                  style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),

                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
