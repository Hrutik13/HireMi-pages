import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';

class CircularBar extends StatelessWidget {
  final double progress;

  // Constructor to accept progress value
  const CircularBar({
    Key? key,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<double> _valueNotifier = ValueNotifier<double>(progress.toDouble());

    return Scaffold(
      body: Center(
        child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.3, // Adjusted size
                maxHeight: MediaQuery.of(context).size.width* 0.3,
              ),
              child: DashedCircularProgressBar.aspectRatio(
                aspectRatio: 1,
                valueNotifier: _valueNotifier,
                progress: progress,
                maxProgress: 100,
                corners: StrokeCap.round,
                foregroundColor: Color(0xFF0F3CC9),
                backgroundColor: const Color(0xffeeeeee),
                foregroundStrokeWidth: 8,
                backgroundStrokeWidth: 8,
                animation: true,
                child: Center(
                  child: ValueListenableBuilder<double>(
                    valueListenable: _valueNotifier,
                    builder: (_, value, __) => Text(
                      '${value.toInt()}%',
                      style: GoogleFonts.roboto(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w500,
                        fontSize: MediaQuery.of(context).size.width* 0.04,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox( height: MediaQuery.of(context).size.height * 0.01,),
            Container(
              child: Text(
                'Hrutik Gaonkar',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                ),
              ),
            ),
            SizedBox( height: MediaQuery.of(context).size.height * 0.01,),
            Container(
              height: MediaQuery.of(context).size.width * 0.06,
              width: MediaQuery.of(context).size.width * 0.25,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: const Color(0xFF0F3CC9)),
              ),
              child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Icon(
                     Icons.verified,
                     color: Color(0xFF0F3CC9),
                   size: MediaQuery.of(context).size.width * 0.03,
                   ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                  Text(
                    'Not Verified',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF0F3CC9),
                      fontWeight: FontWeight.w500,
                      fontSize:  MediaQuery.of(context).size.width * 0.025,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
