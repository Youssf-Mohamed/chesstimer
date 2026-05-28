import 'package:chesstimer/bloc/TimerCubit.dart';
import 'package:chesstimer/bloc/states.dart';
import 'package:chesstimer/component/animated_chess_background.dart';
import 'package:chesstimer/screens/HomeScreen.dart';
import 'package:chesstimer/screens/TimerScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Winnerscreen extends StatelessWidget {
  Winnerscreen(this.winner);
  final String winner;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TimerCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final bool isDraw = winner == 'No one';
        final cubit = TimerCubit.get(context);

        return Scaffold(
          backgroundColor: const Color(0xFFE2E8F0),
          body: Stack(
            children: [
              // Animated slate chess background
              const AnimatedChessBackground(),

              // Tap anywhere to go home
              Positioned.fill(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                      (route) => false,
                    );
                  },
                ),
              ),

              // Main content
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Icon badge
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey.shade200,
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(18),
                            blurRadius: 14,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Icon(
                        isDraw
                            ? Icons.handshake_outlined
                            : Icons.emoji_events_outlined,
                        size: 40,
                        color: isDraw
                            ? const Color.fromARGB(255, 76, 85, 88)
                            : const Color(0xFF1F2937),
                      ),
                    ),

                    const SizedBox(height: 28),

                    // Winner / Draw headline with gradient
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF1F2937),
                          Color.fromARGB(255, 76, 85, 88),
                        ],
                      ).createShader(bounds),
                      child: Text(
                        isDraw ? "It's a Draw!" : '$winner Wins!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'BebasNeue',
                          fontSize: 62.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4.0,
                          shadows: [
                            Shadow(
                              color: Colors.black.withAlpha(25),
                              offset: const Offset(0, 4),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Subtitle
                    const Text(
                      'Tap anywhere to continue',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF6B7280),
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Play Again button
                    GestureDetector(
                      onTap: () async {
                        await cubit.initialGame(time: cubit.lastTime);
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TimerScreen()),
                          (route) => false,
                        );
                      },
                      child: Container(
                        width: 200,
                        height: 52,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Colors.grey.shade200,
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(15),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Play Again',
                            style: TextStyle(
                              fontFamily: 'BebasNeue',
                              fontSize: 26,
                              color: const Color(0xFF1F2937),
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
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
      },
    );
  }
}
