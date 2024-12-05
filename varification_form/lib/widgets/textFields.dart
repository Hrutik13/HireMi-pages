import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  final String title;
  final String hText;

  const CustomTextField({
    Key? key,
    required this.title,
    required this.hText,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isEditable = false; // Controls whether the TextField is editable

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: width * 0.06),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.title,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: width * 0.04,
              ),
            ),
          ),
        ),
        SizedBox(height: height * 0.01),
        Container(
          width: width * 0.9,
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            readOnly: !_isEditable, // Make it editable only when _isEditable is true
            decoration: InputDecoration(
              hintText: widget.hText,
              hintStyle: GoogleFonts.poppins(
                fontSize: width * 0.03,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _isEditable = true; // Enable editing
                  });
                  _focusNode.requestFocus(); // Focus on the TextField
                },
                child: Icon(
                  Icons.edit_outlined,
                  color: Color(0xFF0F3CC9),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
