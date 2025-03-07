import 'package:chesstimer/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerCubit extends Cubit<AppStates>
{
  TimerCubit():super(AppInitialState());

  static TimerCubit get(context) => BlocProvider.of(context);

  //Code here
  int whitetime=5;
  void add(){
    whitetime+=5;
    emit(addtime());
  }
}