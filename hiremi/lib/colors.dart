

import 'package:flutter/material.dart';

class AppColors {
  // Default Colors
  static const Color grey = Colors.grey;
  static const Color red = Colors.red;
  static const Color green = Colors.green;
  static const Color background =Color(0x1AFFC0CB);


  // Color based on password validation (you can add more colors or logic here)
  static Color getBorderColor(String password) {
    if (password.isEmpty) {
      return grey; // Default color for empty password field
    } else if (_isPasswordValid(password)) {
      return green; // Color when password is valid
    } else {
      return red; // Color when password is invalid
    }
  }

  // Function to validate password
  static bool _isPasswordValid(String password) {
    final RegExp _passwordRegExp = RegExp(
      r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );
    return _passwordRegExp.hasMatch(password);
  }
}
