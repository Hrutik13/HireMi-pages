import 'package:flutter/material.dart';

class ProfileVerificationWidget extends StatelessWidget {
  const ProfileVerificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          const Text(
            "Verify Your Account Today!",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStep("Complete\nProfile", true),
              _buildStep("Verification\nPayment", false),
              _buildStep("Wait for\nVerification", false),
              _buildStep("Get Lifetime\nAccess", false),
            ],
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue,
            ),
            child: const Text("Get Verified"),
          ),
        ],
      ),
    );
  }

  Widget _buildStep(String title, bool isCompleted) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: isCompleted ? Colors.white : Colors.blue[200],
          child: isCompleted ? const Icon(Icons.check, color: Colors.blue) : const Text("2"),
        ),
        const SizedBox(height: 4.0),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 12.0),
        ),
      ],
    );
  }
}
