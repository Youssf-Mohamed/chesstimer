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
              Text('Chess Time',style: TextStyle(fontSize: 60),),
            ],
          ),
            SizedBox(height: 100,),
            TextField(

            ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: 100,),

              ElevatedButton(style: ButtonStyle(shape: WidgetStatePropertyAll(CircleBorder( ))),
                onPressed: (){},
                  child: Text('2'),),
              ElevatedButton(style: ButtonStyle(shape: WidgetStatePropertyAll(CircleBorder( ))),
                onPressed: (){},
                child: Text('5'),),
              ElevatedButton(style: ButtonStyle(shape: WidgetStatePropertyAll(CircleBorder( ))),
                onPressed: (){},
                child: Text('10'),),
              ElevatedButton(style: ButtonStyle(shape: WidgetStatePropertyAll(CircleBorder( ))),
                onPressed: (){},
                child: Text('20'),),

              SizedBox(width: 100,),

            ],
          ),
          SizedBox(height: 40,),
          Container(width: 100,height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14.0),color: Colors.white),
            child: Center(child: Text('Start')),),
          SizedBox(height: 40,),
          ElevatedButton(style: ButtonStyle(shape: WidgetStatePropertyAll(RoundedRectangleBorder())),
              onPressed: (){},
              child: Text('Start')),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){},
              child: Text('Options')),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){},
              child: Text('Credit')),
        ],
      ),

    );
    //Joe was here
    //thoristo was here
  }
}
