import 'package:flutter_blue_plus/flutter_blue_plus.dart';

List<BluetoothDevice> getOnlyYMCBoards(List<ScanResult> scanResults) {
  try {
    List<BluetoothDevice> ymcBoards = [];

    for (ScanResult result in scanResults) {
      if (result.device.advName.startsWith('MoodLamp')) {
        ymcBoards.add(result.device);
      }
    }

    return ymcBoards;
  } catch (e) {
    return [];
  }
}
