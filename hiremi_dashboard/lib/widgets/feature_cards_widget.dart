import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeatureCardsWidget extends StatelessWidget {
  const FeatureCardsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery
          .of(context)
          .size
          .width * 0.04),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        // Prevent GridView scrolling
        crossAxisCount: MediaQuery
            .of(context)
            .size
            .width > 600 ? 3 : 2,
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        childAspectRatio: 3 / 2,
        children: [
          _buildFeatureCard(
            "Ask Expert",
            "Ask Anything Get Expert Guidance",
            [Colors.blue.withOpacity(0.3), Colors.blueAccent.withOpacity(0.3)],
            "assets/images/ask expert.png",
            Colors.blue,
          ),
          _buildFeatureCard(
              "Internship",
              "Gain Practical Experience",
              [
                Colors.green.withOpacity(0.3),
                Colors.lightGreen.withOpacity(0.3)
              ],
              "assets/images/internship.png",
              Colors.green
          ),
          _buildFeatureCard(
            "Status",
            "Apply Mentorship & more",
            [Colors.red.withOpacity(0.3), Colors.redAccent.withOpacity(0.3)],
            "assets/images/status.png",
            Colors.red,
          ),
          _buildFeatureCard(
            "Freshers",
            "Gain Practical Experience",
            [
              Colors.orange.withOpacity(0.3),
              Colors.deepOrangeAccent.withOpacity(0.3)
            ],
            "assets/images/freshers.png",
            Colors.orange,
          ),
          _buildFeatureCard(
            "Hiremi 360",
            "Gain Practical Experience",
            [Colors.yellow.withOpacity(0.3), Colors.amber.withOpacity(0.3)],
            "assets/images/hiremi.png",
            Colors.yellow,
          ),

          _buildFeatureCard(
            "Experience",
            "Explore diverse careers",
            [
              Colors.purple.withOpacity(0.3),
              Colors.deepPurpleAccent.withOpacity(0.3)
            ],
            "assets/images/experience.png",
            Colors.purple,
          ),

        ],
      ),
    );
  }

  Widget _buildFeatureCard(String title, String description,
      List<Color> gradientColors, String imagePath, Color borderColor) {
    return Builder(
      builder: (context) {
        // MediaQuery is accessed inside the builder to ensure context is valid
        return Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            gradient: LinearGradient(
              colors: [
                gradientColors[0],
                Colors.white.withOpacity(0.7),
                // Add a white shade with transparency
                gradientColors[1],
              ],
              stops: const [0.0, 0.7, 1.0],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        color: Colors
                            .black, // Text color to contrast with the gradient
                      ),
                      overflow: TextOverflow.ellipsis, // Handle long text
                      maxLines: 1,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      description,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          color: Colors
                              .black45 // Semi-transparent white for better readability
                      ),
                      overflow: TextOverflow.ellipsis, // Handle long text
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
               SizedBox(width: MediaQuery.of(context).size.width * 0.01,), // Add spacing between text and image
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                // Optional: Add rounded corners to the image
                child: Image.asset(
                  imagePath,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover, // Ensure the image fits nicely
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}