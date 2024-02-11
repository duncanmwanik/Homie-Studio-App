// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../../state/ble_state.dart';
// import '../../../theme/theme.dart';

// class ConnectionStatusBanner extends StatelessWidget {
//   const ConnectionStatusBanner({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<BleModel>(builder: (context, ble, child) {
//       return Visibility(
//         visible: !ble.btState || !ble.connected,
//         child: Padding(
//           padding: const EdgeInsets.only(bottom: 10),
//           child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//             Icon(
//               Icons.warning_rounded,
//               color: grayTextColor,
//               size: 16,
//             ),
//             SizedBox(
//               width: 5,
//             ),
//             Flexible(
//               child: Text(
//                 !ble.btState ? "Bluetooth is Off" : "No device connected",
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: grayTextColor,
//                 ),
//               ),
//             ),
//           ]),
//         ),
//       );
//     });
//   }
// }
