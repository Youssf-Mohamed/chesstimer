import 'package:chesstimer/bloc/TimerCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../bloc/states.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TimerCubit,AppStates>(
      listener: (context, state) {

     },
    builder: (context, state) {
      var cubit=TimerCubit.get(context);
     return  Scaffold(
      backgroundColor: Color.fromRGBO(200, 200, 200, 1),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [

          Column(
            children: [
              GestureDetector(
                onTap: () {
                  cubit.add();
                },
                child: Expanded(child: Column(
                  children: [
                    RotatedBox(quarterTurns: 2,child: Text('${cubit.whitetime.toString()+':'}00',style: GoogleFonts.bebasNeue(color: Colors.black,fontSize: 120,fontWeight: FontWeight.bold,shadows: List.filled(100, Shadow(color: Colors.white,offset: Offset(0, 0),blurRadius: 2))),),),
                    RotatedBox(quarterTurns: 2,child: Text('Black',style: GoogleFonts.bebasNeue(color: Colors.black,fontSize: 60,fontWeight: FontWeight.bold,shadows: List.filled(100, Shadow(color: Colors.white,offset: Offset(0, 0),blurRadius: 2))),),),

                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                )),
              ),
              Expanded(child: Column(
                children: [
                  RotatedBox(quarterTurns: 0,child: Text('White',style: GoogleFonts.bebasNeue(color: Colors.white,fontSize: 60,fontWeight: FontWeight.bold,shadows: List.filled(100, Shadow(color: Colors.black,offset: Offset(0, 0),blurRadius: 2))),)),
                  RotatedBox(quarterTurns: 0,child: Text('5:55',style: GoogleFonts.bebasNeue(color: Colors.white,fontSize: 120,fontWeight: FontWeight.bold,shadows: List.filled(100, Shadow(color: Colors.black,offset: Offset(0, 0),blurRadius: 2))),)),

                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ))
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
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.circular(50),
                      border: Border.all(color: Colors.black.withAlpha(100),width: 2)
                  ),
                  child: IconButton(onPressed: ()
                  {

                  },
                    icon:  Icon(Icons.flag,color: Colors.black,),
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

                  },
                    icon:  Icon(Icons.handshake,color: Colors.black,),
                  ),
                ),
                SizedBox(),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(200, 200, 200, 1),
                    borderRadius: BorderRadiusDirectional.circular(50),
                  ),
                  child: IconButton(onPressed: ()
                  {

                  },
                    icon:  Icon(Icons.sync,color: Colors.black,),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(200, 200, 200, 1),
                    borderRadius: BorderRadiusDirectional.circular(50),
                  ),
                  child: IconButton(onPressed: ()
                  {

                  },
                    icon:  Icon(Icons.exit_to_app,color: Colors.black,),
                  ),
                ),
                SizedBox(),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadiusDirectional.circular(50),
                      border: Border.all(color: Colors.black.withAlpha(100),width: 2)
                  ),
                  child: IconButton(onPressed: ()
                  {

                  },
                    icon:  Icon(Icons.handshake,color: Colors.white,),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadiusDirectional.circular(50),
                      border: Border.all(color: Colors.black.withAlpha(100),width: 2)
                  ),
                  child: IconButton(onPressed: ()
                  {

                  },
                    icon:  Icon(Icons.flag,color: Colors.white,),
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
