import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel(
      options: FlutterCarouselOptions(

        height: 150,
        showIndicator: true, // Show the indicator (dots)
        slideIndicator: CircularSlideIndicator(
          slideIndicatorOptions: const SlideIndicatorOptions(
            currentIndicatorColor: Color(0xFF0174C8),
              indicatorBorderColor: Color(0xFF0174C8),
            indicatorRadius: 4,
            itemSpacing: 10,
          )
        ), // Style of the indicator
        autoPlay: true, // Enable auto play
        enlargeCenterPage: true, // Enlarge the center page
        floatingIndicator: false,
        viewportFraction: 1,

      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: MediaQuery.of(context).size.width-40,
                margin:  EdgeInsets.symmetric( horizontal: MediaQuery.of(context).size.width * 0.01, ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white, // You can change the background color
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              'Hire mi $i', // Custom text
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inder(
                                color: Colors.black,
                                fontSize: MediaQuery.of(context).size.width * 0.05,
                                fontWeight: FontWeight.w600,

                            ),
                          ),
                          Text(
                            ' Career ka backup,\nSuccess ka gaurantee$i', // Custom text
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: MediaQuery.of(context).size.width * 0.03,
                              fontWeight: FontWeight.w500,

                            ),
                          ),

                        ],
                      ),
                      Container(
                        child: Image.asset('assets/images/slide 1.png',
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width * 0.25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
