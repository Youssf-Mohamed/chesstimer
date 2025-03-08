import 'package:flutter/material.dart';


Widget CircleButtton({
  required int time,
  required Function(int) fun,
  int sec = 0,
  required Function(int) zer,
}) => GestureDetector(
  onTap: () {
    fun(time);   // Sets the minute
    zer(0);      // Resets the seconds to 0
  },
  child: Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
      border: Border.all(
        color: Colors.black,
        width: 2,
      ),
      boxShadow: const [
        BoxShadow(
          color: Colors.black,
          spreadRadius: 1,
          blurRadius: 1,
          offset: Offset(0, 3),
        ),
      ],
    ),
    alignment: Alignment.center,
    child: Text(
      '$time',
      style: const TextStyle(fontSize: 22, color: Colors.black),
    ),
  ),
);



Widget NorButton({required BuildContext context, required String name, required Widget func}) => GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => func),
    );
  },
  child: Container(
    width: 231,
    height: 53,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14.0),
      color: Colors.white,
    ),
    child: Center(
      child: Text(
        '$name',
        style: TextStyle(
          fontSize: 35,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          shadows: List.filled(100, const Shadow(color: Colors.black, offset: Offset(0, 0), blurRadius: 1.7)),
        ),
      ),
    ),
  ),
);
// CupertinoButton.filled(
//     child: Text('$_selectedm :') , onPressed: ()=> showCupertinoModalPopup(
//     context: context, builder: (_) => SizedBox(
//   width: double.infinity,
//   height: 250,
//   child: CupertinoPicker(
//     backgroundColor: Colors.white,
//     itemExtent: 60,
//     scrollController: FixedExtentScrollController(
//       initialItem: -1,
//     ),
//     children: [Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Expanded(
//           child: ListView.builder(itemCount: 61,itemBuilder: (context, index) {
//             return Center(child: Text('${index}'));
//           },),
//         ),
//         Expanded(
//           child: ListView.builder(itemCount: 61,itemBuilder: (context, index) {
//             return Center(child: Text('${index}'));
//           },),
//         ),
//       ],
//     )],
//     onSelectedItemChanged: (int value){
//       setState(() {
//         _selectedm=value;
//         print(value);
//       });
//
//     },
//   ),
//
// )
// )
// ),
// CupertinoButton.filled(
//     child: Text('$_selecteds :') , onPressed: ()=> showCupertinoModalPopup(
//     context: context, builder: (_) => SizedBox(
//   width: double.infinity,
//   height: 250,
//   child: CupertinoPicker(
//     backgroundColor: Colors.white,
//     itemExtent: 60,
//     scrollController: FixedExtentScrollController(
//       initialItem: -1,
//     ),
//     children: const[
//       Text('0'),
//       Text('1'),
//       Text('2'),
//       Text('3'),
//       Text('4'),
//       Text('5'),
//       Text('6'),
//       Text('7'),
//       Text('8'),
//       Text('9'),
//       Text('10'),
//       Text('11'),
//       Text('12'),
//       Text('13'),
//       Text('14'),
//       Text('15'),
//       Text('16'),
//       Text('17'),
//       Text('18'),
//       Text('19'),
//       Text('20'),
//       Text('21'),
//       Text('22'),
//       Text('23'),
//       Text('24'),
//       Text('25'),
//     ],
//     onSelectedItemChanged: (int value){
//       setState(() {
//         _selecteds=value;
//         print(value);
//       });
//
//     },
//   ),
//
// )
// )
// ),
