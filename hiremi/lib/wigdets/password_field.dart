import 'package:flutter/material.dart';
import 'package:hiremi/colors.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final ValueChanged<String> onChanged;
  final bool isPasswordMismatch;
  final bool areBothPasswordsValid; // Flag to indicate both passwords are valid
  final bool isBothEmpty; // Flag to check if both fields are empty

  const PasswordField({
    Key? key,
    required this.controller,
    required this.obscureText,
    required this.hintText,
    required this.onChanged,
    this.isPasswordMismatch = false,
    this.areBothPasswordsValid = false,
    this.isBothEmpty = false,
  }) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    // Determine the border and icon colors based on the current state
    Color borderColor = AppColors.grey; // Default color for empty fields
    if (widget.isPasswordMismatch) {
      borderColor = AppColors.red; // Mismatch state
    } else if (widget.areBothPasswordsValid) {
      borderColor = AppColors.green; // Valid and matching passwords
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: TextField(
          controller: widget.controller,
          obscureText: _obscureText,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            hintText: widget.hintText,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor), // Dynamic border color
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor), // Dynamic border on focus
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
                  color: borderColor, // Dynamic lock icon color
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
      ),
    );
  }
}
