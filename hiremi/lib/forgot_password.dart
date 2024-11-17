

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  bool _obscureText = true;
  bool _obscureTextConfirm = true;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  String? _passwordMessage = 'Min 8 characters, 1 upper case, 1 digit, 1 special character';
  bool _isPasswordInvalid = false;
  bool _isConfirmPasswordInvalid = false;

  // Regular expression to validate the password
  bool _isValidPassword(String password) {
    RegExp regex = RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    return regex.hasMatch(password);
  }

  // Validate both password fields
  void _validatePassword() {
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    setState(() {
      // Check if the primary password is valid
      _isPasswordInvalid = !_isValidPassword(password);

      // Check if the confirm password matches
      _isConfirmPasswordInvalid = confirmPassword != password;

      // Update the message based on validity
      if (_isPasswordInvalid) {
        _passwordMessage = "Invalid password. Please follow the requirements.";
      } else if (_isConfirmPasswordInvalid) {
        _passwordMessage = "Enter the same password in both fields.";
      } else {
        _passwordMessage = null; // Null indicates no error
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
       // this is background
      Stack(
        children: [
          Positioned(
            top: -MediaQuery.of(context).size.height * 0.23,
            left: -MediaQuery.of(context).size.width * 0.5,
            right: -MediaQuery.of(context).size.width * 0.5,
            child: Container(
              width: MediaQuery.of(context).size.width * 2,
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: const BoxDecoration(
                color: Color(0x1AFFC0CB),
                shape: BoxShape.circle,
              ),
            ),
          ),

          SingleChildScrollView(
            child: Column(
              children: [
                //this is logo
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

                //this is middle image
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
                    child: Text(
                      'New Password',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: _obscureText,
                    onChanged: (text) {
                      _validatePassword(); // Validate password as the user types
                    },
                    decoration: InputDecoration(
                      hintText: ' ********',
                      fillColor: _isPasswordInvalid
                          ? Colors.red[50]
                          : (_isValidPassword(_passwordController.text)
                          ? Colors.green
                          : Colors.white), // Green background if valid
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _isPasswordInvalid
                              ? Colors.red
                              : (_isValidPassword(_passwordController.text)
                              ? Colors.green
                              : Colors.blue), // Green focused border if valid
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _isPasswordInvalid
                              ? Colors.red
                              : (_isValidPassword(_passwordController.text)
                              ? Colors.green
                              : Colors.grey), // Green border if valid
                        ),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          width: 60,
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: _isPasswordInvalid
                                    ? Colors.red
                                    : (_isValidPassword(_passwordController.text)
                                    ? Colors.green
                                    : Colors.grey),
                              ),
                            ),
                          ),
                          child: Icon(
                            Icons.lock,
                            color: _isPasswordInvalid
                                ? Colors.red
                                : (_isValidPassword(_passwordController.text)
                                ? Colors.green
                                : Colors.grey), // Green icon if valid
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
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Confirm New Password',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
                  child: TextField(
                    controller: _confirmPasswordController,
                    obscureText: _obscureTextConfirm,
                    onChanged: (text) {
                      _validatePassword(); // Validate confirm password as the user types
                    },
                    decoration: InputDecoration(
                      hintText: ' ********',
                      fillColor: _isConfirmPasswordInvalid
                          ? Colors.red[50]
                          : (_isValidPassword(_confirmPasswordController.text)
                          ? Colors.green
                          : Colors.white), // Green background if valid

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _isConfirmPasswordInvalid
                              ? Colors.red
                              : (_isValidPassword(_confirmPasswordController.text)
                              ? Colors.green
                              : Colors.blue), // Green focused border if valid
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _isConfirmPasswordInvalid
                              ? Colors.red
                              : (_isValidPassword(_confirmPasswordController.text)
                              ? Colors.green
                              : Colors.grey), // Green border if valid
                        ),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          width: 60,
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: _isConfirmPasswordInvalid
                                    ? Colors.red
                                    : (_isValidPassword(_confirmPasswordController.text)
                                    ? Colors.green
                                    : Colors.grey),
                              ),
                            ),
                          ),
                          child: Icon(
                            Icons.lock,
                            color: _isConfirmPasswordInvalid
                                ? Colors.red
                                : (_isValidPassword(_confirmPasswordController.text)
                                ? Colors.green
                                : Colors.grey), // Green icon if valid
                          ),
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureTextConfirm ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureTextConfirm = !_obscureTextConfirm;
                          });
                        },
                      ),
                    ),
                  ),
                ),

                // Single container for all messages
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40,
                    child: Text(
                      _passwordMessage ?? 'Min 8 characters, 1 upper case, 1 digit, 1 special character',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: (_passwordMessage == null) ? Colors.black : Colors.red,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    child: ElevatedButton(
                      onPressed: () {
                        _validatePassword(); // Validate password when button is pressed
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFC1272D),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Reset Password',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
