import 'package:flutter/material.dart';
import 'package:hiremi/colors.dart';

class PasswordField extends StatefulWidget {
  // Parameters for the PasswordField widget
  final TextEditingController controller; // Controller to manage text input
  final bool obscureText; // Flag to toggle text visibility (for password)
  final String hintText; // Placeholder text for the field
  final ValueChanged<String> onChanged; // Callback to handle text changes
  final String? Function(String?)? validator; // Optional validator function for input validation
  final String? errorMessage; // Optional error message for validation
  final bool isPasswordMismatch; // Flag to indicate if passwords do not match (new feature)

  const PasswordField({
    Key? key,
    required this.controller,
    required this.obscureText,
    required this.hintText,
    required this.onChanged,
    this.validator,
    this.errorMessage,
    this.isPasswordMismatch = false, // Default is false, but can be overridden
  }) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true; // Local state for managing text visibility (password)

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    // If passwords do not match , set the border color to red
    Color borderColor = widget.isPasswordMismatch ? AppColors.red : AppColors.getBorderColor(widget.controller.text);
    Color iconColor = borderColor;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: widget.controller,
              obscureText: _obscureText,
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                hintText: widget.hintText,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor), // Set border color dynamically based on validation
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor), // Set border color when the field is focused
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.red), // Set border color to red if there's an error
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border(right: BorderSide(color: borderColor)),
                    ),
                    child: Icon(
                      Icons.lock,
                      color: iconColor,
                    ),
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
            ),
            // If there's an error message, display it below the input field
            if (widget.errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  widget.errorMessage!,
                  style: TextStyle(
                    color: AppColors.red, // Set error message color to red
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
