import 'package:permission_handler/permission_handler.dart';

Future<void> checkForLocationPermissions() async {
  if (await Permission.location.isDenied) {
    await Permission.location.request();
  }
}
