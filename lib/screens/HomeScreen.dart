import 'package:chesstimer/screens/TimerScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text('Chess Time', style: TextStyle(fontSize: 60)),
            ],
          ),
          SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
                  color: Colors.white,
                ),
                child: TextField(
                  controller: TextEditingController(),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Minutes'),
                ),
              ),
              SizedBox(width: 20),
              Container(
                width: 120,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
                  color: Colors.white,
                ),
                child: TextField(
                  controller: TextEditingController(),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Seconds'),
                ),
              ),
            ],
          ),
          SizedBox(height: 20), // <- This line is now inside the children list
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: 100),
              ElevatedButton(
                style: ButtonStyle(shape: WidgetStatePropertyAll(CircleBorder())),
                onPressed: () {},
                child: Text('2', style: TextStyle(fontSize: 22, color: Colors.black)),
              ),
              ElevatedButton(
                style: ButtonStyle(shape: WidgetStatePropertyAll(CircleBorder())),
                onPressed: () {},
                child: Text('5', style: TextStyle(fontSize: 22, color: Colors.black)),
              ),
              ElevatedButton(
                style: ButtonStyle(shape: WidgetStatePropertyAll(CircleBorder())),
                onPressed: () {},
                child: Text('10', style: TextStyle(fontSize: 22, color: Colors.black)),
              ),
              ElevatedButton(
                style: ButtonStyle(shape: WidgetStatePropertyAll(CircleBorder())),
                onPressed: () {},
                child: Text('20', style: TextStyle(fontSize: 22, color: Colors.black)),
              ),
              SizedBox(width: 100),
            ],
          ),
          SizedBox(height: 40),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TimerScreen()),
              );
            },
            child: Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                color: Colors.white,
              ),
              child: Center(
                child: Text('Start', style: TextStyle(fontSize: 22, color: Colors.black)),
              ),
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TimerScreen()),
              );
            },
            child: Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                color: Colors.white,
              ),
              child: Center(
                child: Text('Option', style: TextStyle(fontSize: 22, color: Colors.black)),
              ),
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TimerScreen()),
              );
            },
            child: Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                color: Colors.white,
              ),
              child: Center(
                child: Text('Credit', style: TextStyle(fontSize: 22, color: Colors.black)),
              ),
            ),
          ),
        ],
      ),



    );
    //Joe was here
    //thoristo was here
  }
}
