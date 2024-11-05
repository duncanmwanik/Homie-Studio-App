import 'dart:async';
// import 'dart:io';

// import 'package:http/http.dart' as http;
// import '_helpers/_common_helpers/global_helper.dart';

// import '../../_widgets/components/toast.dart';

Future<bool> noInternet() async {
  // try {
  //   final url = Uri.https('google.com');

  //   var response = await http.get(url).timeout(Duration(seconds: 10));

  //   if (response.statusCode == 200) {
  //     return true;
  //   } else {
  //     logError('internet-checker', 'Bad internet connection');
  //     return false;
  //   }
  // } on TimeoutException catch (_) {
  //   logError('internet-checker', 'Slow internet connection.');
  //   return false;
  // } on SocketException catch (_) {
  //   showToast(0, 'Check your internet connection.');
  //   logError('internet-checker', 'Check internet connection.');

  //   return false;
  // } catch (e) {
  //   logError('internet-checker', e);
  //   showToast(0, 'No internet connection.');
  //   logError('internet-checker', 'No internet connection.');

  //   return false;
  // }

  return false;
}
