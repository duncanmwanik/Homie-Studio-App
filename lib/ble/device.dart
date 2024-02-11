import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'ble_service.dart';

class ScannedDevice extends StatefulWidget {
  const ScannedDevice({Key? key, required this.device}) : super(key: key);

  final BluetoothDevice device;

  @override
  State<ScannedDevice> createState() => _ScannedDeviceState();
}

class _ScannedDeviceState extends State<ScannedDevice> {
  // For showing progress indicator when connecting
  bool isConnecting = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BluetoothConnectionState>(
        stream: widget.device.connectionState,
        initialData: BluetoothConnectionState.disconnected,
        builder: (c, snapshot) {
          bool isConnectedDevice = snapshot.data == BluetoothConnectionState.connected;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: ListTile(
              onTap: () async {
                setState(() => isConnecting = true);
                //
                await bleService.connectToBoard(widget.device);
                //
                setState(() => isConnecting = false);
              },
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
              //
              // Board Unique Name
              //
              title: Text(widget.device.platformName, style: TextStyle(fontWeight: FontWeight.bold)),
              //
              trailing: !isConnecting
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //
                        // Prompt connection
                        //
                        if (!isConnectedDevice) Icon(Icons.arrow_forward_rounded, color: Colors.grey),
                        //
                        // Green Icon to show connected device
                        //
                        if (isConnectedDevice) Icon(Icons.check_circle_rounded),
                        //
                        if (isConnectedDevice) SizedBox(width: 10),
                        //
                        // Disconnect Button
                        //
                        if (isConnectedDevice)
                          GestureDetector(
                            onTap: () => bleService.disconnectBoard(widget.device),
                            child: Icon(Icons.close_rounded),
                          ),
                        //
                      ],
                    )
                  : SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.green, strokeWidth: 3)),
            ),
          );
        });
  }
}
