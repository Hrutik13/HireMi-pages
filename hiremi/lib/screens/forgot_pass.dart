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
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String? _errorMessage;
  bool _isPasswordMismatch = false; // Flag for mismatched passwords
  bool _areBothPasswordsValid = false; // Flag for valid and matching passwords
  bool _isBothEmpty = true; // Flag for empty password fields

  // Regular expression to validate password strength
  bool _isPasswordValidFunction(String password) {
    final RegExp _passwordRegExp = RegExp(
      r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );
    return _passwordRegExp.hasMatch(password);
  }

  // Validation logic for both password fields
  void _validateFields() {
    final newPassword = _newPasswordController.text;
    final confirmPassword = _confirmPasswordController.text;

    setState(() {
      _isBothEmpty = newPassword.isEmpty && confirmPassword.isEmpty;

      if (!_isBothEmpty) {
        _areBothPasswordsValid =
            _isPasswordValidFunction(newPassword) &&
                newPassword == confirmPassword &&
                _isPasswordValidFunction(confirmPassword);

        _isPasswordMismatch = !_areBothPasswordsValid;
      } else {
        _areBothPasswordsValid = false;
        _isPasswordMismatch = false;
      }

      // Set error message
      if (_isPasswordMismatch) {
        _errorMessage = "Enter same password in both textfields.";
      } else if (!_isBothEmpty && !_areBothPasswordsValid) {
        _errorMessage = 'Password must be at least 8 characters, include 1 uppercase, 1 digit, and 1 special character.';
      } else {
        _errorMessage = null;
      }
    });
  }

  void _onPasswordChange(String value) {
    _validateFields();
  }

  // Logic to handle password reset
  void _resetPassword() {
    if (_areBothPasswordsValid && !_isBothEmpty) {
      print('Password reset successful');
    } else {
      setState(() {
        _errorMessage = _errorMessage ?? "Please correct the errors above.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundCircle(),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Image.asset(
                    'assets/images/main (1).png',
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                ),
                Text(
                  'Create new Password,',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Image.asset(
                    'assets/images/Reset password-bro.png',
                    width: 323,
                    height: 323,
                  ),
                ),
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
                          TextSpan(text: 'New Password'),
                          TextSpan(
                            text: ' *',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                PasswordField(
                  controller: _newPasswordController,
                  obscureText: true,
                  hintText: '********',
                  onChanged: _onPasswordChange,
                  isPasswordMismatch: _isPasswordMismatch,
                  areBothPasswordsValid: _areBothPasswordsValid,
                  isBothEmpty: _isBothEmpty,
                ),
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
                          TextSpan(text: 'Confirm New Password'),
                          TextSpan(
                            text: ' *',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                PasswordField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  hintText: '********',
                  onChanged: _onPasswordChange,
                  isPasswordMismatch: _isPasswordMismatch,
                  areBothPasswordsValid: _areBothPasswordsValid,
                  isBothEmpty: _isBothEmpty,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40,
                    child: Text(
                      _errorMessage ?? 'Password must be at least 8 characters, include 1 uppercase, 1 digit, and 1 special character.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: _errorMessage != null ? Colors.red : Colors.black,
                      ),
                    ),
                  ),
                ),
                ResetButton(onPressed: _resetPassword),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
