import 'package:chesstimer/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerCubit extends Cubit<AppStates>
{
  TimerCubit():super(AppInitialState());

  static TimerCubit get(context) => BlocProvider.of(context);

  //Code here
  int whiteTime=300;
  int blackTime=300;
  bool whiteTurn=true;
  var remainingTime=300;
  bool whiteDraw=false;
  bool blackDraw=false;
  void whiteTimeRemaining({required int time}){
    whiteTime=time;
    whiteTurn=false;
    emit(BlackTurnState());
  }
  void blackTimeRemaining({required int time}){
    blackTime=time;
    whiteTurn=true;
    emit(WhiteTurnState());
  }
  String secondToString({required int seconds}){
    String time='';
    int minutes=0;
    minutes=seconds~/60;
    seconds=seconds%60;
    time="${minutes}:${seconds}";
    if(minutes.toString().length==1)
    {
      time="0${minutes}:";
    }
    else{
      time="${minutes}:";
    }
    if(seconds.toString().length==1)
      {
        time=time+"0${seconds}";
      }
    else{
      time=time+"${seconds}";
    }
    return time;
  }

  /// Time is The Time in Second
  void initialGame({required int time}){
    whiteTime=time;
    blackTime=time;
    whiteTurn=true;
    remainingTime=time;
    emit(InitialGameState());
  }

  void timeUpdate(){
    emit(SelectTimeState());
  }

  int screenRotate=0;
  void rotateScreen(){
    if(screenRotate==0)
      {
        screenRotate=2;
      }
    else{
      screenRotate=0;
    }
    emit(ScreenRotateState());
  }
}