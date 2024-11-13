import 'dart:convert';

import 'package:universal_ble/universal_ble.dart';

import '../../_helpers/debug.dart';
import '../../_providers/_providers.dart';
import '../../_services/hive/local_storage_service.dart';
import '../../_widgets/others/toast.dart';
import 'permissions.dart';

Ble bleService = Ble();
String serviceUuid = '4fafc201-1fb5-459e-8fcc-c5c9c331914b';
String characteristicUuid = 'beb54800-36e1-4688-b7f5-ea07361b26a8';

class Ble {
  Future<void> connectDevice(BleDevice device) async {
    try {
      // connect to board
      await UniversalBle.connect(device.deviceId);

      // discover services
      List<BleService> services = await UniversalBle.discoverServices(device.deviceId);
      for (var service in services) {
        for (var characteristic in service.characteristics) {
          if (characteristic.uuid.toString() == characteristicUuid) {
            state.ble.updateConnectedDeviceXtics(null, characteristic);
          }
        }
      }
      //
      state.ble.updateConnectedDevice(device);
      await globalBox.put('lastBleDevice', device.deviceId);

      // Get connection/disconnection updates
      UniversalBle.onConnectionChange = (String deviceId, bool isConnected, String? error) {
        logError('OnConnectionChange ${device.name}, $deviceId, $isConnected Error: $error', error);
        showToast(0, 'Disconnected from ${device.name}.');
      };
    } catch (e) {
      logError('connectDevice', e);
      showToast(0, 'Could not connect to ${device.name}.');
    }
  }

  Future<void> disconnectDevice(BleDevice device) async {
    try {
      await UniversalBle.disconnect(device.deviceId);
      state.ble.updateConnectedDevice(null);
    } catch (e) {
      state.ble.updateConnectedDevice(null);
      logError('disconnectDevice', e);
    }
  }

  Future<void> scanDevices() async {
    try {
      await checkBlePermissions();
      // Start scan only if Bluetooth is powered on
      if (await UniversalBle.getBluetoothAvailabilityState() == AvailabilityState.poweredOff) {
        showToast(2, 'Turn on Bluetooth first.');
        return;
      }
      UniversalBle.onScanResult = (bleDevice) async {
        await connectDevice(bleDevice);
      };
      UniversalBle.startScan(scanFilter: ScanFilter(withServices: [serviceUuid]));
      // UniversalBle.getSystemDevices(withServices: [serviceUuid]);
      UniversalBle.stopScan();
    } catch (e) {
      logError('scanDevices', e);
    }
  }

  bool isConnectedDevice(BleDevice device) {
    if (state.ble.connectedDevice != null) {
      return state.ble.connectedDevice!.deviceId == device.deviceId;
    } else {
      return false;
    }
  }

  void sendData(String message) async {
    try {
      if (state.ble.connectedDevice != null) {
        BleDevice device = state.ble.connectedDevice!;
        await UniversalBle.writeValue(device.deviceId, '', '', utf8.encode(message), BleOutputProperty.withoutResponse);
      }
    } catch (e) {
      logError('sendData', e);
    }
  }
}
