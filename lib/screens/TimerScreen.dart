import 'package:chesstimer/bloc/TimerCubit.dart';
import 'package:chesstimer/screens/WinnerScreen.dart';
import 'package:chesstimer/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import '../bloc/states.dart';

class TimerScreen extends StatelessWidget {
  TimerScreen({super.key});
  final CountdownController _whitecontroller =
      CountdownController(autoStart: true);
  final CountdownController _blackcontroller =
      CountdownController(autoStart: false);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TimerCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = TimerCubit.get(context);
        return RotatedBox(
          quarterTurns:
              0, // cubit.screenRotate, - Keep this as per your original logic
          child: SafeArea(
            top: true,
            child: Scaffold(
              backgroundColor: const Color(0xFFE2E8F0),
              body: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Top Half - Black Player
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (!cubit.whiteTurn) {
                              _whitecontroller.start();
                              _blackcontroller.pause();
                              cubit.whiteTurnState();
                            }
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: double.infinity,
                            color: cubit.whiteTurn
                                ? const Color(0xFF1F2937) // Inactive Black side
                                : const Color(0xFF2D6A4F), // Active Black side
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RotatedBox(
                                  quarterTurns: 2,
                                  child: Countdown(
                                    seconds: cubit.blackTime,
                                    build: (p0, p1) => Text(
                                      cubit
                                          .secondToString(seconds: p1.toInt())
                                          .toString(),
                                      style: TextStyle(
                                        fontFamily: 'BebasNeue',
                                        color: Colors.white,
                                        fontSize: 95,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    interval:
                                        const Duration(milliseconds: 1000),
                                    controller: _blackcontroller,
                                    onFinished: () {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Winnerscreen('White'),
                                        ),
                                        (route) => false,
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 10),
                                RotatedBox(
                                  quarterTurns: 2,
                                  child: Text(
                                    'Black',
                                    style: TextStyle(
                                      fontFamily: 'BebasNeue',
                                      color: cubit.whiteTurn
                                          ? const Color(0xFF9CA3AF)
                                          : const Color(0xFFD8F3DC),
                                      fontSize: 32.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Bottom Half - White Player
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (cubit.whiteTurn) {
                              _blackcontroller.start();
                              _whitecontroller.pause();
                              cubit.blackTurnState();
                            }
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: double.infinity,
                            color: cubit.whiteTurn
                                ? const Color(
                                    0xFF0F766E) // Active White side - deep teal
                                : const Color(
                                    0xFFCBD5E1), // Inactive White side - slate-300
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RotatedBox(
                                  quarterTurns: 0,
                                  child: Text(
                                    'White',
                                    style: TextStyle(
                                      fontFamily: 'BebasNeue',
                                      color: cubit.whiteTurn
                                          ? const Color(
                                              0xFFCCFBF1) // light teal label when active
                                          : const Color(
                                              0xFF475569), // slate-600 label when inactive
                                      fontSize: 32.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                RotatedBox(
                                  quarterTurns: 0,
                                  child: Countdown(
                                    seconds: cubit.whiteTime,
                                    build: (p0, p1) => Text(
                                      cubit
                                          .secondToString(seconds: p1.toInt())
                                          .toString(),
                                      style: TextStyle(
                                        fontFamily: 'BebasNeue',
                                        color: cubit.whiteTurn
                                            ? Colors.white // white text on teal
                                            : const Color(
                                                0xFF1F2937), // dark text when inactive
                                        fontSize: 95,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    interval:
                                        const Duration(milliseconds: 1000),
                                    controller: _whitecontroller,
                                    onFinished: () {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Winnerscreen('Black'),
                                        ),
                                        (route) => false,
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Center glassmorphic control bar
                  Container(
                    height: 70,
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(225),
                      borderRadius: BorderRadius.circular(35),
                      border:
                          Border.all(color: Colors.grey.shade200, width: 1.5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(20),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Black Resign (Flag)
                        RotatedBox(
                          quarterTurns: 2,
                          child: Container(
                            width: 48.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFEE2E2), // Light red tint
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: const Color(0xFFFCA5A5), width: 1.2),
                            ),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Winnerscreen('White'),
                                  ),
                                  (route) => false,
                                );
                              },
                              icon: const Icon(
                                size: 24.0,
                                Icons.flag,
                                color: Color(0xFFDC2626), // Solid red
                              ),
                            ),
                          ),
                        ),
                        // Black Draw Offer (Handshake)
                        RotatedBox(
                          quarterTurns: 2,
                          child: Container(
                            width: 48.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: cubit.blackDraw
                                  ? const Color(0xFFD1FAE5)
                                  : Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: cubit.blackDraw
                                    ? const Color(0xFF10B981)
                                    : Colors.grey.shade200,
                                width: 1.2,
                              ),
                            ),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                cubit.blackWantDraw();
                                if (cubit.blackDraw && cubit.whiteDraw) {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          Winnerscreen('No one'),
                                    ),
                                    (route) => false,
                                  );
                                }
                              },
                              icon: Icon(
                                size: 24.0,
                                Icons.handshake,
                                color: cubit.blackDraw
                                    ? const Color(0xFF047857)
                                    : const Color(0xFF4B5563),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        // Global Exit / Stop Button (Center)
                        Container(
                          width: 52.0,
                          height: 52.0,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1F2937),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withAlpha(40),
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                                (route) => false,
                              );
                            },
                            icon: const Icon(
                              size: 26.0,
                              Icons.exit_to_app,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        // White Draw Offer (Handshake)
                        Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: cubit.whiteDraw
                                ? const Color(0xFFD1FAE5)
                                : Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: cubit.whiteDraw
                                  ? const Color(0xFF10B981)
                                  : Colors.grey.shade200,
                              width: 1.2,
                            ),
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              cubit.whiteWantDraw();
                              if (cubit.blackDraw && cubit.whiteDraw) {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Winnerscreen('No one'),
                                  ),
                                  (route) => false,
                                );
                              }
                            },
                            icon: Icon(
                              size: 24.0,
                              Icons.handshake,
                              color: cubit.whiteDraw
                                  ? const Color(0xFF047857)
                                  : const Color(0xFF4B5563),
                            ),
                          ),
                        ),
                        // White Resign (Flag)
                        Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFEE2E2), // Light red tint
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: const Color(0xFFFCA5A5), width: 1.2),
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Winnerscreen('Black'),
                                ),
                                (route) => false,
                              );
                            },
                            icon: const Icon(
                              size: 24.0,
                              Icons.flag,
                              color: Color(0xFFDC2626), // Solid red
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
