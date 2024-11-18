import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../wigdets/background.dart';
import '../wigdets/password_field.dart';
import '../wigdets/reset_button.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  // Controllers to handle text input for password fields
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // Error message to be displayed if password validation fails
  String? _errorMessage;

  // Regular expression to validate password strength (minimum 8 chars, 1 uppercase, 1 digit, and 1 special character)
  bool _isPasswordValid(String password) {
    final RegExp _passwordRegExp = RegExp(
      r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );
    return _passwordRegExp.hasMatch(password);
  }

  // Validation logic for the new password
  void _validateNewPassword(String value) {
    if (value.isEmpty) {
      setState(() {
        _errorMessage = 'Password must be at least 8 characters, include 1 uppercase, 1 digit, and 1 special character.';
      });
    } else if (!_isPasswordValid(value)) {
      setState(() {
        _errorMessage =
        'Password must be at least 8 characters, include 1 uppercase, 1 digit, and 1 special character.';
      });
    } else {
      // Reset error message if password is valid
      setState(() {
        _errorMessage = null;
      });
    }
  }

  // Validation logic for the confirm password field
  void _validateConfirmPassword(String value) {
    if (value.isEmpty) {
      setState(() {
        _errorMessage = 'Password must be at least 8 characters, include 1 uppercase, 1 digit, and 1 special character.';
      });
    } else if (value != _newPasswordController.text) {
      // If confirm password doesn't match new password, show an error message
      setState(() {
        _errorMessage = "Enter same password in both fields.";
      });
    } else {
      // Reset error message if passwords match
      setState(() {
        _errorMessage = null;
      });
    }
  }

  // Logic to handle password reset
  void _resetPassword() {
    final newPassword = _newPasswordController.text;
    final confirmPassword = _confirmPasswordController.text;

    // If passwords do not match, show error message
    if (newPassword != confirmPassword) {
      setState(() {
        _errorMessage = "Enter same password in both fields.";
      });
    } else {
      // Proceed with password reset logic (to be added here)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background circle widget placed as a positioned element in the stack
          const BackgroundCircle(),

          // Scrollable content for the Forgot Password page
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // App logo or image at the top of the screen
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Image.asset(
                    'assets/images/main (1).png',
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                ),

                // Header text for the reset password page
                Text(
                  'Create new Password,',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),

                // Image related to password reset
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Image.asset(
                    'assets/images/Reset password-bro.png',
                    width: 323,
                    height: 323,
                  ),
                ),

                // New Password Label
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        children: const [
                          TextSpan(
                            text: 'New Password',
                          ),
                          TextSpan(
                            text: ' *', // Red asterisk to denote required field
                            style: TextStyle(
                              color: Colors.red, // Red color for the asterisk
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Password field for entering new password
                PasswordField(
                  controller: _newPasswordController,
                  obscureText: true,
                  hintText: '********',
                  onChanged: _validateNewPassword,
                ),

                // Confirm Password Label
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        children: const [
                          TextSpan(
                            text: 'Confirm New Password',
                          ),
                          TextSpan(
                            text: ' *', // Red asterisk to denote required field
                            style: TextStyle(
                              color: Colors.red, // Red color for the asterisk
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Password field for confirming the new password
                PasswordField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  hintText: '********',
                  onChanged: _validateConfirmPassword,
                ),

                // Error message container (shown if there is an error)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40,
                    child: Text(
                      _errorMessage ?? // Show error message if available
                          'Password must be at least 8 characters, include 1 uppercase, 1 digit, and 1 special character.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: _errorMessage != null ? Colors.red : Colors.black, // Error text in red
                      ),
                    ),
                  ),
                ),

                // Reset button to trigger the password reset process
                ResetButton(onPressed: _resetPassword),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
