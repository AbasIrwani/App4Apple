// import 'package:flutter/material.dart';
//
// class nxtButtonV2 extends StatefulWidget {
//   const nxtButtonV2({
//     Key? key,
//     required this.text,
//     required this.func,
//   }) : super(key: key);
//   final Widget text;
//   final void Function() func;
//
//   @override
//   State<nxtButtonV2> createState() => _nxtButtonV2State();
// }
//
// class _nxtButtonV2State extends State<nxtButtonV2> {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       borderRadius: BorderRadius.circular(15),
//       onTap: widget.func,
//       child: Container(
//         alignment: Alignment.center,
//         height: 50,
//         width: 120,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           color: Theme.of(context).scaffoldBackgroundColor ==
//                   const Color(0xff1E1F20)
//               ? Colors.cyan.shade800
//               : Colors.cyan.shade300,
//         ),
//         child: widget.text,
//       ),
//     );
//   }
// }
