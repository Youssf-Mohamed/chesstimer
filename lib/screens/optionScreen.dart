import 'package:flutter/material.dart';
import 'package:chesstimer/component/animated_chess_background.dart';

class OptionScreen extends StatelessWidget {
  const OptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2E8F0),
      body: Stack(
        children: [
          const AnimatedChessBackground(),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Options',
                  style: TextStyle(
                    fontSize: 50,
                    color: Color(0xFF1F2937),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 50),

                // 🎵 Volume slider with music icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Rounded container
                    Container(
                      width: 200, // smaller width
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(200),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.shade300, width: 1.5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(15),
                            spreadRadius: 1,
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Slider(
                        value: 0.5,
                        onChanged: (value) {},
                        activeColor: const Color(0xFF1F2937),
                        inactiveColor: Colors.grey[300],
                      ),
                    ),
                    const SizedBox(width: 8), // Less space between slider and icon
                    const Icon(Icons.volume_up, color: Color(0xFF1F2937)),
                  ],
                ),

                const SizedBox(height: 20),

                IconButton(
                  icon: const Icon(Icons.brightness_2, color: Color(0xFF1F2937)),
                  onPressed: () {},
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
