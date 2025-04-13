import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreditScreen extends StatelessWidget {
  const CreditScreen({Key? key}) : super(key: key);

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

          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Credits',
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

                Text(
                  'Ahmed Samy',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    shadows: List.filled(
                      50,
                      const Shadow(
                        color: Colors.black,
                        offset: Offset(0, 0),
                        blurRadius: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Yousef Mohamed',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    shadows: List.filled(
                      50,
                      const Shadow(
                        color: Colors.black,
                        offset: Offset(0, 0),
                        blurRadius: 2,
                      ),
                    ),
                  ),
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
