import 'package:chesstimer/component/component.dart';
import 'package:chesstimer/screens/CreditScreen.dart';
import 'package:chesstimer/screens/TimerScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/TimerCubit.dart';
import '../bloc/states.dart';


class HomeScreen extends StatelessWidget {

  int _selectedm = 0 ;
  int _selecteds = 0 ;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TimerCubit,AppStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var mediaQuery = MediaQuery.of(context);
        var cubit = TimerCubit.get(context);

        double screenWidth = mediaQuery.size.width;
        double screenHeight = mediaQuery.size.height;

        return SafeArea(
          top: true,
          child: Scaffold(
            backgroundColor:Colors.white70,
            body: Stack(
              children: [
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6,),
                  itemCount: 1000,
                  itemBuilder: (context, index) {
                    int row = index ~/ 6;
                    int col = index % 6;
                    bool isBlack = (row + col) % 2 == 0;
                    return Container(
                      color: isBlack ? Colors.black : const Color.fromRGBO(200, 200, 200, 1),
                      child: const Center(),
                    );
                  },
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: Text('Chess Time',textAlign: TextAlign.center, style: TextStyle(fontSize: 40.0,color: Colors.white,fontWeight: FontWeight.bold,shadows: List.filled(100, const Shadow(color: Colors.black,offset: Offset(0, 0),blurRadius: 2.3)))),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0),
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
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: ListView.builder(
                                                itemCount: 60,
                                                itemBuilder: (context, index) {
                                                  return ListTile(
                                                    title: Center(child: Text('$index')),
                                                    onTap: () {
                                                      _selectedm = index;
                                                      cubit.timeUpdate(); // This will trigger a rebuild, but _selectedm here is local
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
                                                    title: Center(child: Text('$index')),
                                                    onTap: () {
                                                      _selecteds = index;
                                                      cubit.timeUpdate(); // This will trigger a rebuild, but _selecteds here is local
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
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.access_time_filled_sharp,
                                color: Colors.black,
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
                      NorButton(context: context, name: 'Start', func: () async{
                        int time = (_selectedm * 60) + _selecteds;
                        if(time > 0)
                        {
                          await cubit.initialGame(time: time);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => TimerScreen(),));
                        }
                      },),
                      const SizedBox(height: 20),
                      NorButton(context: context, name: 'Credit', func: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CreditScreen(),));
                      },),
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