// import 'package:flutter/material.dart';
//
// class nxtButton extends StatelessWidget {
//   nxtButton({Key? key, required this.text, required this.func})
//       : super(key: key);
//   String text;
//   void Function() func;
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       borderRadius: BorderRadius.circular(15),
//       onTap: func,
//       child: Container(
//         alignment: Alignment.center,
//         height: 50,
//         width: 80,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           color: Theme.of(context).scaffoldBackgroundColor ==
//                   const Color(0xff1E1F20)
//               ? Colors.cyan.shade800
//               : Colors.cyan.shade300,
//         ),
//         child: Text(
//           text,
//           style: TextStyle(
//               fontFamily: 'ir-sharp-m',
//               fontSize: 18,
//               color: Theme.of(context).scaffoldBackgroundColor ==
//                       const Color(0xff1E1F20)
//                   ? const Color(0xfff7f7f7)
//                   : const Color(0xff1E1F20)),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
// }
