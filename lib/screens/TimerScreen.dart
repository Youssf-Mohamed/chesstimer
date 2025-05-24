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
       quarterTurns: 0,//cubit.screenRotate,
       child: Scaffold(
        backgroundColor: Color.fromRGBO(200, 200, 200, 1),
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
                                seconds: cubit.blackTime, build: (p0, p1) => Text(cubit.secondToString(seconds: p1.toInt()).toString(),style: GoogleFonts.bebasNeue(color: Colors.black,fontSize: 120,fontWeight: FontWeight.bold,shadows: List.filled(3, Shadow(color: Colors.white,offset: Offset(-2, -2),blurRadius: 2))),),
                                interval: Duration(milliseconds: 1000),
                                controller: _blackcontroller,
                                onFinished: (){
                                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Winnerscreen('White'),), (route) => false,);
                                },
                              ),
                          ),
                          RotatedBox(
                            quarterTurns: 2,
                            child: Text(
                              'Black',
                              style: GoogleFonts.bebasNeue(
                                  color: Colors.black,
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold,
                                  shadows: List.filled(
                                      3,
                                      Shadow(
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
                          RotatedBox(quarterTurns: 0,child: Text('White',style: GoogleFonts.bebasNeue(color: Colors.white,fontSize: 60,fontWeight: FontWeight.bold,shadows: List.filled(3, Shadow(color: Colors.black,offset: Offset(2, 2),blurRadius: 2))),)),
                          RotatedBox(quarterTurns:0, child: Countdown(
                            seconds: cubit.whiteTime, build: (p0, p1) => Text(cubit.secondToString(seconds: p1.toInt()).toString(),style: GoogleFonts.bebasNeue(color: Colors.white,fontSize: 120,fontWeight: FontWeight.bold,shadows: List.filled(3, Shadow(color: Colors.black,offset: Offset(2, 2),blurRadius: 2))),),
                            interval: Duration(milliseconds: 1000),
                            controller: _whitecontroller,
                            onFinished: (){
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Winnerscreen('Black'),), (route) => false,);
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
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadiusDirectional.circular(50),
                          border: Border.all(color: Colors.black.withAlpha(100),width: 2)
                      ),
                      child: IconButton(onPressed: ()
                      {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Winnerscreen('White'),), (route) => false,);
                      },
                        icon:  Icon(Icons.flag,color: Colors.white,),
                      ),
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 2,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadiusDirectional.circular(50),
                          border: Border.all(color: Colors.black.withAlpha(100),width: 2)
                      ),
                      child: IconButton(onPressed: ()
                      {
                        cubit.blackWantDraw();
                      if(cubit.blackDraw&&cubit.whiteDraw)
                      {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Winnerscreen('No one'),), (route) => false,);
                      }
                      },
                        icon:  Icon(Icons.handshake,color: cubit.blackDraw?Colors.greenAccent:Colors.white,),
                      ),
                    ),
                  ),
                  SizedBox(),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: Color.fromRGBO(200, 200, 200, 1),
                  //     borderRadius: BorderRadiusDirectional.circular(50),
                  //   ),
                  //   child: IconButton(onPressed: ()
                  //   {
                  //     cubit.rotateScreen();
                  //   },
                  //     icon:  Icon(Icons.sync,color: Colors.black,),
                  //   ),
                  // ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(200, 200, 200, 1),
                      borderRadius: BorderRadiusDirectional.circular(50),
                    ),
                    child: IconButton(onPressed: ()
                    {
                      Navigator.pop(context);
                    },
                      icon:  Icon(Icons.exit_to_app,color: Colors.black,),
                    ),
                  ),
                  SizedBox(),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.circular(50),
                        border: Border.all(color: Colors.black.withAlpha(100),width: 2)
                    ),
                    child: IconButton(onPressed: ()
                    {
                      cubit.whiteWantDraw();
                      if(cubit.blackDraw&&cubit.whiteDraw)
                      {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Winnerscreen('No one'),), (route) => false,);
                      }

                    },
                      icon:  Icon(Icons.handshake,color: cubit.whiteDraw?Colors.greenAccent:Colors.black,),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.circular(50),
                        border: Border.all(color: Colors.black.withAlpha(100),width: 2)
                    ),
                    child: IconButton(onPressed: ()
                    {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Winnerscreen('Black'),), (route) => false,);
                    },
                      icon:  Icon(Icons.flag,color: Colors.black,),
                    ),
                  ),
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
