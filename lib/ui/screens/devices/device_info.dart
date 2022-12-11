import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:homie_ble/methods/ble.dart';
import 'package:homie_ble/ui/screens/home/home.dart';

import '../../../methods/globals.dart';
import '../../theme/theme.dart';
import 'change_bt_name.dart';
import '../../widgets/back_button.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/other_widgets.dart';
import '../../widgets/toast/toast.dart';

class DevicesInfoScreen extends StatefulWidget {
  const DevicesInfoScreen({required this.device, super.key});

  final BluetoothDevice device;

  @override
  DevicesInfoScreenState createState() => DevicesInfoScreenState();
}

class DevicesInfoScreenState extends State<DevicesInfoScreen> {
  Widget infoTile(String title, String value) {
    return ListTile(
      tileColor: secondaryColor,
      onTap: () {},
      title: Text(
        title,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.white),
      ),
      trailing: Text(
        value,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        centerTitle: true,
        leading: backButton(context),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          // ---------- linear progress indicator
          loadingWidget(context),

          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  // flex: 2,
                  child: Text(
                    widget.device.name,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      TextEditingController? textController = TextEditingController(text: bt.device.name);
                      showBtNameChangeDialog(context, textController: textController, maxLength: 50, onTap: () {
                        if (textController.text.length < 3) {
                          toast(0, "Name is too short!");
                        } else if (textController.text == bt.device.name) {
                          toast(2, "Name is unchanged!");
                        } else {
                          sendDataToDevice("n${textController.text}");
                          disconnectFromSelectedDevice(bt.device);
                          toast(2, "Reconnnect lamp to view changes!");
                          Navigator.pushAndRemoveUntil<dynamic>(
                            context,
                            MaterialPageRoute<dynamic>(
                              builder: (BuildContext context) => HomeScreen(),
                            ),
                            (route) => false, //if you want to disable back feature set to false
                          );
                        }
                      });
                    },
                    splashRadius: 20,
                    iconSize: 20,
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
          ruler(w, 1, 0),

          infoTile("ID", "1999"),

          ruler(w, 1, 0),

          infoTile("Lamp Version", "PRO"),

          ruler(w, 1, 0),

          infoTile("Software Version", "1.1"),

          ruler(w, 1, 0),

          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 20),
          //   child: ElevatedButton(
          //     onPressed: () {},
          //     style: ElevatedButton.styleFrom(
          //         backgroundColor: themeColors[global.themeNo],
          //         elevation: 1,
          //         minimumSize: Size(w * 0.5, 50),
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(20.0),
          //         )),
          //     child: Text(
          //       "Check for updates",
          //       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
