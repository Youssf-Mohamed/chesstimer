import 'package:chesstimer/component/component.dart';
import 'package:chesstimer/screens/CreditScreen.dart';
import 'package:chesstimer/screens/TimerScreen.dart';
import 'package:feedback/feedback.dart';
import 'package:feedback_sentry/feedback_sentry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import '../bloc/TimerCubit.dart';
import '../bloc/states.dart';
import 'package:chesstimer/component/animated_chess_background.dart';

class HomeScreen extends StatelessWidget {
  int _selectedm = 0;

  int _selecteds = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TimerCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var mediaQuery = MediaQuery.of(context);
        var cubit = TimerCubit.get(context);

        double screenWidth = mediaQuery.size.width;
        double screenHeight = mediaQuery.size.height;

        return SafeArea(
          top: true,
          child: Scaffold(
            backgroundColor: const Color(0xFFE2E8F0),
            body: Stack(
              children: [
                const AnimatedChessBackground(),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 12, top: 8),
                            child: GestureDetector(
                              onTap: () {
                                BetterFeedback.of(context)
                                    .showAndUploadToSentry();
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.grey.shade200,
                                    width: 1.5,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withAlpha(15),
                                      blurRadius: 8,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.bug_report_outlined,
                                  size: 20,
                                  color: Color(0xFF64748B),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: ShaderMask(
                              shaderCallback: (bounds) => const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFF1F2937), // deep slate
                                  Color.fromARGB(
                                      255, 76, 85, 88), // teal accent
                                ],
                              ).createShader(bounds),
                              child: Text(
                                'Tchimer',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 64.0,
                                  color: Colors.white, // masked by shader
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 6.0,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black.withAlpha(30),
                                      offset: const Offset(0, 4),
                                      blurRadius: 8,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF1F2937),
                            elevation: 2,
                            shadowColor: Colors.black.withAlpha(25),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0),
                              side: BorderSide(
                                  color: Colors.grey.shade200, width: 1.5),
                            ),
                            fixedSize: Size(screenWidth * 0.85, 53),
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  height: screenHeight * 0.5,
                                  child: Column(
                                    children: [
                                      MaterialButton(
                                        child: const Text('Close'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: ListView.builder(
                                                itemCount: 60,
                                                itemBuilder: (context, index) {
                                                  return ListTile(
                                                    title: Center(
                                                        child: Text('$index')),
                                                    onTap: () {
                                                      _selectedm = index;
                                                      cubit
                                                          .timeUpdate(); // This will trigger a rebuild, but _selectedm here is local
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: ListView.builder(
                                                itemCount: 61,
                                                itemBuilder: (context, index) {
                                                  return ListTile(
                                                    title: Center(
                                                        child: Text('$index')),
                                                    onTap: () {
                                                      _selecteds = index;
                                                      cubit
                                                          .timeUpdate(); // This will trigger a rebuild, but _selecteds here is local
                                                    },
                                                  );
                                                },
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
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(width: 24),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    '$_selectedm : $_selecteds',
                                    style: const TextStyle(
                                      fontSize: 24.0,
                                      color: Color(0xFF1F2937),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.access_time_filled_sharp,
                                color: Color(0xFF4B5563),
                                size: 30.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleButtton(
                            width: 60.0,
                            time: 2,
                            func: () {
                              _selectedm = 2;
                              _selecteds = 0;
                              cubit.timeUpdate();
                            },
                          ),
                          CircleButtton(
                            width: 60.0,
                            time: 5,
                            func: () {
                              _selectedm = 5;
                              _selecteds = 0;
                              cubit.timeUpdate();
                            },
                          ),
                          CircleButtton(
                            width: 60.0,
                            time: 10,
                            func: () {
                              _selectedm = 10;
                              _selecteds = 0;
                              cubit.timeUpdate();
                            },
                          ),
                          CircleButtton(
                            width: 60.0,
                            time: 20,
                            func: () {
                              _selectedm = 20;
                              _selecteds = 0;
                              cubit.timeUpdate();
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      NorButton(
                        context: context,
                        name: 'Start',
                        func: () async {
                          try {
                            int time = (_selectedm * 60) + _selecteds;
                            if (time > 0) {
                              await cubit.initialGame(time: time);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TimerScreen(),
                                  ));
                            }
                          } catch (exception, stackTrace) {
                            await Sentry.captureException(exception,
                                stackTrace: stackTrace);
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      NorButton(
                        context: context,
                        name: 'Credit',
                        func: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CreditScreen(),
                              ));
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
