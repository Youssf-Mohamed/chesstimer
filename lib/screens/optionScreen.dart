import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class OptionScreen extends StatelessWidget {
  const OptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        children: [
          SizedBox.expand(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
              ),
              itemCount: 60,
              itemBuilder: (context, index) {
                int row = index ~/ 6;
                int col = index % 6;
                bool isBlack = (row + col) % 2 == 0;
                return Container(
                  color: isBlack
                      ? Colors.black
                      : const Color.fromRGBO(200, 200, 200, 1),
                );
              },
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Options',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: List.filled(
                      100,
                      const Shadow(
                        color: Colors.black,
                        offset: Offset(0, 0),
                        blurRadius: 2.3,
                      ),
                    ),
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
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Slider(
                        value: 0.5,
                        onChanged: (value) {},
                        activeColor: Colors.white,
                        inactiveColor: Colors.grey[400],
                      ),
                    ),
                    const SizedBox(width: 8), // Less space between slider and icon
                    const Icon(Icons.volume_up, color: Colors.white),
                  ],
                ),

                const SizedBox(height: 20),

                IconButton(
                  icon: const Icon(Icons.brightness_2, color: Colors.white),
                  onPressed: () {},
                ),

                const SizedBox(height: 50),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
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
                      color: Colors.black,
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
