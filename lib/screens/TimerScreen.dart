import 'package:chesstimer/bloc/TimerCubit.dart';
import 'package:chesstimer/screens/WinnerScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import '../bloc/states.dart';

class TimerScreen extends StatelessWidget {
  TimerScreen({super.key});
  final CountdownController _whitecontroller = CountdownController(autoStart: true);
  final CountdownController _blackcontroller = CountdownController(autoStart: false);
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<TimerCubit,AppStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var cubit=TimerCubit.get(context);
        return  RotatedBox(
          quarterTurns: 0, // cubit.screenRotate, - Keep this as per your original logic
          child: SafeArea(
            top: true,
            child: Scaffold(
              backgroundColor: const Color.fromRGBO(200, 200, 200, 1),
              body: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if(!cubit.whiteTurn) {
                              _whitecontroller.start();
                              _blackcontroller.pause();
                              cubit.whiteTurnState();
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            color: cubit.whiteTurn?Colors.transparent:Colors.green,
                            child: Column(
                              children: [
                                RotatedBox(quarterTurns: 2,child:
                                Countdown(
                                  seconds: cubit.blackTime, build: (p0, p1) => Text(cubit.secondToString(seconds: p1.toInt()).toString(),style: GoogleFonts.bebasNeue(color: Colors.black,fontSize: 80,fontWeight: FontWeight.bold,shadows: List.filled(3, const Shadow(color: Colors.white,offset: Offset(-2, -2),blurRadius: 2))),),
                                  interval: const Duration(milliseconds: 1000),
                                  controller: _blackcontroller,
                                  onFinished: (){
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  Winnerscreen('White'),), (route) => false,);
                                  },
                                ),
                                ),
                                RotatedBox(
                                  quarterTurns: 2,
                                  child: Text(
                                    'Black',
                                    style: GoogleFonts.bebasNeue(
                                        color: Colors.black,
                                        fontSize: 40.0, // Fixed logical pixel size
                                        fontWeight: FontWeight.bold,
                                        shadows: List.filled(
                                            3,
                                            const Shadow(
                                                color: Colors.white,
                                                offset: Offset(-2,-2),
                                                blurRadius: 2
                                            )
                                        )
                                    ),
                                  ),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if(cubit.whiteTurn)
                            {
                              _blackcontroller.start();
                              _whitecontroller.pause();
                              cubit.blackTurnState();
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            color: cubit.whiteTurn?Colors.green:Colors.transparent,
                            child: Column(
                              children: [
                                RotatedBox(quarterTurns: 0,child: Text('White',style: GoogleFonts.bebasNeue(color: Colors.white,fontSize: 40.0,fontWeight: FontWeight.bold,shadows: List.filled(3, const Shadow(color: Colors.black,offset: Offset(2, 2),blurRadius: 2))),)),
                                RotatedBox(quarterTurns:0, child: Countdown(
                                  seconds: cubit.whiteTime, build: (p0, p1) => Text(cubit.secondToString(seconds: p1.toInt()).toString(),style: GoogleFonts.bebasNeue(color: Colors.white,fontSize: 80,fontWeight: FontWeight.bold,shadows: List.filled(3, const Shadow(color: Colors.black,offset: Offset(2, 2),blurRadius: 2))),),
                                  interval: const Duration(milliseconds: 1000),
                                  controller: _whitecontroller,
                                  onFinished: (){
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  Winnerscreen('Black'),), (route) => false,);
                                  },
                                ),)
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.grey,
                      height:1,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RotatedBox(
                          quarterTurns: 2,
                          child: Container(
                            width: 50.0, // Fixed logical pixel size
                            height: 50.0, // Fixed logical pixel size
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadiusDirectional.circular(50),
                            ),
                            child: IconButton(onPressed: ()
                            {
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  Winnerscreen('White'),), (route) => false,);
                            },
                              icon:  const Icon(size: 28.0,Icons.flag,color: Colors.white,), // Fixed logical pixel size
                            ),
                          ),
                        ),
                        RotatedBox(
                          quarterTurns: 2,
                          child: Container(
                            width: 50.0, // Fixed logical pixel size
                            height: 50.0, // Fixed logical pixel size
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadiusDirectional.circular(50),
                            ),
                            child: IconButton(onPressed: ()
                            {
                              cubit.blackWantDraw();
                              if(cubit.blackDraw&&cubit.whiteDraw)
                              {
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  Winnerscreen('No one'),), (route) => false,);
                              }
                            },
                              icon:  Icon(size: 28.0,Icons.handshake,color: cubit.blackDraw?Colors.greenAccent:Colors.white,), // Fixed logical pixel size
                            ),
                          ),
                        ),
                        const SizedBox(),
                        Container(
                          width: 50.0, // Fixed logical pixel size
                          height: 50.0, // Fixed logical pixel size
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(200, 200, 200, 1),
                            borderRadius: BorderRadiusDirectional.circular(50),
                          ),
                          child: IconButton(onPressed: ()
                          {
                            Navigator.pop(context);
                          },
                            icon:  const Icon(size: 28.0,Icons.exit_to_app,color: Colors.black,), // Fixed logical pixel size
                          ),
                        ),
                        const SizedBox(),
                        Container(
                          width: 50.0, // Fixed logical pixel size
                          height: 50.0, // Fixed logical pixel size
                          decoration: BoxDecoration(

                            color: Colors.white,
                            borderRadius: BorderRadiusDirectional.circular(50),
                          ),
                          child: IconButton(onPressed: ()
                          {
                            cubit.whiteWantDraw();
                            if(cubit.blackDraw&&cubit.whiteDraw)
                            {
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  Winnerscreen('No one'),), (route) => false,);
                            }

                          },
                            icon:  Icon(size: 28.0,Icons.handshake,color: cubit.whiteDraw?Colors.greenAccent:Colors.black,), // Fixed logical pixel size
                          ),
                        ),
                        Container(
                          width: 50.0, // Fixed logical pixel size
                          height: 50.0, // Fixed logical pixel size
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadiusDirectional.circular(50),
                          ),
                          child: IconButton(onPressed: ()
                          {
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  Winnerscreen('Black'),), (route) => false,);
                          },
                            icon:  const Icon(size: 28.0,Icons.flag,color: Colors.black,), // Fixed logical pixel size
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