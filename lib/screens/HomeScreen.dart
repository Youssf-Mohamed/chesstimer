import 'package:chesstimer/component/component.dart';
import 'package:chesstimer/screens/TimerScreen.dart';
import 'package:chesstimer/screens/optionScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedm = 0 ;
  int _selecteds = 0 ;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white70,
      body: Stack(
        children: [
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6),
            itemBuilder: (context, index) {
              int row = index ~/ 6;
              int col = index % 6;
              bool isBlack = (row + col) % 2 == 0;
              return Container(
                  color: isBlack ? Colors.black : Color.fromRGBO(200, 200, 200, 1),
                  child: Center(),
              );
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text('Chess Time', style: TextStyle(fontSize: 80 ,color: Colors.white,fontWeight: FontWeight.bold,shadows: List.filled(100, Shadow(color: Colors.black,offset: Offset(0, 0),blurRadius: 2.3))))
                ],
              ),
              SizedBox(height: 100),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Button background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  fixedSize: const Size(307, 53), // Same width and height as the container
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 400,
                        child: Column(
                          children: [
                            ElevatedButton(
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
                                      itemCount: 61,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          title: Center(child: Text('$index')),
                                          onTap: () {
                                            setState(() {
                                              _selectedm = index;
                                            });
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
                                            setState(() {
                                              _selecteds = index;
                                            });
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
                    const SizedBox(width: 24), // Spacer to balance icon on right
                    Expanded(
                      child: Center(
                        child: Text(
                          '$_selectedm : $_selecteds',
                          style: const TextStyle(
                            fontSize: 35,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.punch_clock,
                      color: Colors.black,
                      size: 50,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20), // <- This line is now inside the children list
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 100),

                  CircleButtton(
                    time: 2,
                    fun: (selectedTime) => setState(() => _selectedm = selectedTime),
                    zer: (selectedTime) => setState(() => _selecteds = selectedTime), // Resets seconds to 0
                  ),
                  CircleButtton(
                    time: 5,
                    fun: (selectedTime) => setState(() => _selectedm = selectedTime),
                    zer: (selectedTime) => setState(() => _selecteds = selectedTime), // Resets seconds to 0
                  ),
                  CircleButtton(
                    time: 10,
                    fun: (selectedTime) => setState(() => _selectedm = selectedTime),
                    zer: (selectedTime) => setState(() => _selecteds = selectedTime), // Resets seconds to 0
                  ),
                  CircleButtton(
                    time: 20,
                    fun: (selectedTime) => setState(() => _selectedm = selectedTime),
                    zer: (selectedTime) => setState(() => _selecteds = selectedTime), // Resets seconds to 0
                  ),






                  SizedBox(width: 100),
                ],
              ),
              SizedBox(height: 40),
              NorButton(context: context, name: 'Start', func: TimerScreen()),
              SizedBox(height: 20),
              NorButton(context: context, name: 'Option', func: OptionScreen()),
              SizedBox(height: 20),
              NorButton(context: context, name: 'Credit', func: TimerScreen()),
            ],
          ),
        ],
      ),



    );
    //Joe was here
    //thoristo was here
  }
}
