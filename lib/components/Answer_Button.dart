// import 'package:flutter/material.dart';
//
// class AnswerButton extends StatefulWidget {
//   AnswerButton(
//       {Key? key,
//       required this.addText,
//       required this.addColor,
//       required this.addFunction})
//       : super(key: key);
//   final String addText;
//   final Color addColor;
//   final void Function()? addFunction;
//   @override
//   State<AnswerButton> createState() => _AnswerButtonState();
// }
//
// class _AnswerButtonState extends State<AnswerButton> {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//         splashColor: Colors.cyan.withOpacity(0.3),
//         onTap: widget.addFunction,
//         borderRadius: BorderRadius.circular(20.0),
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 200),
//           height: 60,
//           padding: const EdgeInsets.all(15.0),
//           width: MediaQuery.of(context).size.width - 26,
//           decoration: BoxDecoration(
//             color: widget.addColor,
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Text(
//             widget.addText,
//             style: const TextStyle(fontFamily: 'ir-sharp-m', fontSize: 14),
//             textDirection: TextDirection.rtl,
//             textAlign: TextAlign.right,
//           ),
//         ));
//   }
// }
