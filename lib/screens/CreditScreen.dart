import 'package:flutter/material.dart';
import 'package:chesstimer/component/animated_chess_background.dart';

class CreditScreen extends StatelessWidget {
  const CreditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2E8F0),
      body: Stack(
        children: [
          const AnimatedChessBackground(),

          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Credits',
                  style: TextStyle(
                    fontSize: 50,
                    color: Color(0xFF1F2937),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),

                const SizedBox(height: 50),

                const Text(
                  'Ahmed Samy',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xFF374151),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Yousef Mohamed',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xFF374151),
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 50),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1F2937),
                    foregroundColor: Colors.white,
                    elevation: 2,
                    shadowColor: Colors.black.withAlpha(25),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Back',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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
