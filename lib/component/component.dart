import 'package:flutter/material.dart';

Widget CircleButtton(
        {required int time, required func(), width = 50.0, height = 50.0}) =>
    GestureDetector(
      onTap: () {
        func();
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey.shade200,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(15),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          '$time',
          style: const TextStyle(
            fontSize: 22,
            color: Color(0xFF1F2937),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

Widget NorButton(
        {required BuildContext context,
        required String name,
        required func()}) =>
    GestureDetector(
      onTap: () {
        func();
      },
      child: Container(
        width: 231,
        height: 53,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.0),
          color: Colors.white,
          border: Border.all(
            color: Colors.grey.shade200,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(15),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            '$name',
            style: const TextStyle(
              fontSize: 28,
              color: Color(0xFF1F2937),
              fontWeight: FontWeight.bold,
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
