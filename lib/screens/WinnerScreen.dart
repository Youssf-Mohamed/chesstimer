import 'package:chesstimer/bloc/TimerCubit.dart';
import 'package:chesstimer/bloc/states.dart';
import 'package:chesstimer/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Winnerscreen extends StatelessWidget {
   Winnerscreen(this.winner);
   final String winner;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TimerCubit,AppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {

        return Scaffold(
          backgroundColor: Color.fromRGBO(200, 200, 200, 1),
          body: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen(),), (route) => false,);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("$winner is the winner",style: GoogleFonts.bebasNeue(color: Colors.black,fontSize: 90,fontWeight: FontWeight.bold,shadows: List.filled(100, Shadow(color: Colors.white,offset: Offset(0, 0),blurRadius: 2))),),
                  Text('press on the screen to continue',style: GoogleFonts.bebasNeue(color: Colors.black,fontSize: 60,fontWeight: FontWeight.bold,shadows: List.filled(100, Shadow(color: Colors.white,offset: Offset(0, 0),blurRadius: 2))),),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
