import 'package:permission_handler/permission_handler.dart';

Future<void> checkBlePermissions() async {
  if (await Permission.location.isDenied) {
    await Permission.location.request();
  }
}
