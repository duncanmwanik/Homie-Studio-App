// import 'package:flutter/material.dart';
// import 'package:homie_ble/ui/widgets/divider/custom_divider.dart';

// class HelpScreen extends StatefulWidget {
//   @override
//   _HelpScreenState createState() => _HelpScreenState();
// }

// class _HelpScreenState extends State<HelpScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       backgroundColor: Color(0xff101010),
//       appBar: AppBar(
//         leading: GestureDetector(
//           onTap: () => Navigator.pop(context),
//           child: Padding(
//             padding: const EdgeInsets.only(top: 5),
//             child: Icon(
//               Icons.arrow_back,
//               color: Colors.white,
//               size: 25,
//             ),
//           ),
//         ),
//         centerTitle: true,
//         title: Padding(
//           padding: const EdgeInsets.only(top: 10),
//           child: Text(
//             'Quick Help',
//             textAlign: TextAlign.center,
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
//           ),
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: ListView(
//         physics: BouncingScrollPhysics(),
//         children: <Widget>[
//           Container(
//             padding: EdgeInsets.all(15),
//             margin: EdgeInsets.only(bottom: 20, top: 20),
//             decoration: new BoxDecoration(
//               color: Color(0xff313131),
//               shape: BoxShape.circle,
//             ),
//             child: Icon(
//               Icons.blur_on,
//               color: Colors.blue,
//               size: w * 0.2,
//             ),
//           ),
//           CustomDivider('Connecting A Device'),
//           _text("1. Make sure Bluetooth is turned on."),
//           _text("2. Ensure the lamp is paired in the phone's Bluetooth settings."),
//           _text("3. Tap on the Devices List to see a list of available paired lamps and select one."),
//           _text("4. Press the Connect button."),
//           _text("4. Walahi! You've done it. You should see an alert saying 'Connected!' at the top of the screen."),
//           _text("5. If you want to disconnect the lamp, tap the Disconnect button."),
//           _text("6. If you can't find the lamp, verify step 2 above then tap the Refresh button."),
//           _text("7. If the lamp is unresponsive, disconnect then connect it again."),
//           _text("7. If you think the lamp is acting weird, press '#' on the remote to reset it."),
//           _text("# TIP : Tap the refresh button anytime you have to. It will always update the devices list."),
//           SizedBox(height: 15),
//           Row(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 child: Text("Open Bluetooth Settings"),
//                 style: ElevatedButton.styleFrom(
//                     primary: Colors.blue, // background (button) color
//                     onPrimary: Colors.white, // foreground (text) color
//                     shape: RoundedRectangleBorder(
//                       borderRadius: new BorderRadius.circular(30.0),
//                     )),
//                 onPressed: () {},
//               ),
//             ],
//           ),
//           SizedBox(height: 15),
//           // ---------------  Picking A Device
//           CustomDivider('PICK A DEVICE'),
//           _image("images/devices.png"),
//           _desc(Icons.looks_one_rounded, "Open Drawer."),
//           _desc(Icons.looks_two_rounded, "Open Quick Help."),
//           _desc(Icons.looks_3_rounded, "Open Devices List."),
//           _desc(Icons.looks_4_rounded, "Refresh button."),
//           _desc(Icons.looks_5_rounded, "Connect or Disconnect button."),
//           SizedBox(height: h * 0.05),
//           // ---------------  Navbar
//           CustomDivider('NAVIGATION BAR'),
//           _image("images/navbar.png"),
//           _desc(Icons.looks_one_rounded, "Open Patterns tab."),
//           _desc(Icons.looks_two_rounded, "Open Colors tab."),
//           _desc(Icons.looks_3_rounded, "Favorites tab."),
//           _desc(Icons.looks_4_rounded, "Change remote buttons and voice commands functions."),
//           SizedBox(height: h * 0.05),
//           // ---------------  Brightness
//           CustomDivider('BRIGHTNESS'),
//           _image("images/brightness.png"),
//           _desc(Icons.looks_one_rounded, "Set brightness to 5%."),
//           _desc(Icons.looks_two_rounded, "Slide to set a specific brightness."),
//           _desc(Icons.looks_3_rounded, "Set brightness to 100%."),
//           SizedBox(height: h * 0.05),
//           // ---------------  Colors
//           CustomDivider('COLORS'),
//           _image("images/colors.png"),
//           _desc(Icons.looks_one_rounded, "Slide around to set a custom color.\nAutomatically sent to device."),
//           _desc(Icons.looks_two_rounded, "Add custom color to Favorites."),
//           _desc(Icons.looks_3_rounded, "Type the hex code of a custom color if you know one."),
//           _desc(Icons.looks_4_rounded, "Send custom hex code color to device."),
//           _desc(Icons.looks_5_rounded,
//               "Main Colors chosen by us. \nPress to send color to device. \nLongpress to add to Favorites."),
//           SizedBox(height: h * 0.05),
//           // ---------------  Patterns
//           CustomDivider('PATTERNS'),
//           _image("images/patterns.png"),
//           _desc(Icons.stop, "Patterns. \nPress to send pattern to device. \nLongpress to add to Favorites."),
//           SizedBox(height: h * 0.05),
//           // ---------------  Favorites
//           CustomDivider('FAVORITES'),
//           _image("images/fav.png"),
//           _desc(Icons.keyboard_arrow_right, "Press any color or pattern to send to device."),
//           _desc(Icons.keyboard_arrow_right, "Longpress to remove from Favorites."),
//           // ---------------  Changing Assignments
//           CustomDivider('CHANGE ASSIGNMENTS'),
//           _image("images/changes.png"),
//           _desc(Icons.keyboard_arrow_right, "Press any color or pattern to change it."),
//           _desc(Icons.keyboard_arrow_right,
//               "You can change the colors or patterns each remote button or voice command numbers will show."),
//           _desc(Icons.keyboard_arrow_right,
//               "# LEARN : Pressing remote button 'One' and saying voice command 'One' will show the same color or pattern."),
//           // ---------------  Remote Control
//           CustomDivider('REMOTE CONTROL'),
//           _desc(Icons.keyboard_arrow_right, "Press '*' on the remote to switch between colors and patters."),
//           _desc(Icons.keyboard_arrow_right,
//               "Press '0' on the remote to switch between Voice mode and Bluetooth mode. You can't use Bluetooth control and voice control at the same time."),
//           _desc(Icons.keyboard_arrow_right, "Press '#' to restart the lamp incase it is misbehaving."),
//           _desc(Icons.keyboard_arrow_right, "# Pressing '1' to '9' will change color or pattern."),
//           // ---------------  Voice Control
//           CustomDivider('VOICE CONTROL'),
//           _desc(Icons.keyboard_arrow_right, "Say words 'One' to 'Nine' to change color or pattern."),
//           _desc(Icons.keyboard_arrow_right,
//               "For best results, be within 2 to 3 metres from the lamp and say the word slowly."),

//           SizedBox(height: h * 0.1),
//           Icon(
//             Icons.directions_run_rounded,
//             color: Colors.amber,
//             size: w * 0.2,
//           ),
//           Center(child: _text("Okay now! Everything gon be irie ...")),
//           SizedBox(height: 15),
//         ],
//       ),
//     );
//   }

//   Widget _text(message) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
//       child: Text(
//         message,
//         textAlign: TextAlign.left,
//         style: TextStyle(
//           fontSize: 15,
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }

//   Widget _desc(IconData icon, description) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           width: 20,
//         ),
//         Icon(
//           icon,
//           color: Colors.white,
//         ),
//         Expanded(child: _text(description))
//       ],
//     );
//   }

//   Widget _image(path) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//       child: Container(
//         decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.amber)),
//         child: ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.asset(path)),
//       ),
//     );
//   }
// }
