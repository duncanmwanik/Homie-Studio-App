import 'package:url_launcher/url_launcher.dart';

import '../_widgets/dialogs/confirmation_dialog.dart';

Future<void> sendFeedbackDialog() async {
  await showConfirmationDialog(
    title: 'We love feedback!',
    content: 'Send a suggestion, ask for help, report a bug or send us love.',
    yeslabel: 'Send Email',
    showBottomPadding: true,
    onAccept: () async {
      String email = Uri.encodeComponent('duncopixels@gmail.com');
      String subject = Uri.encodeComponent('Feedback');
      String body = Uri.encodeComponent('Hi there, ');
      Uri mail = Uri.parse('mailto:$email?subject=$subject&body=$body');
      if (await launchUrl(mail)) {
        //email app opened
      } else {
        //email app is not opened
      }
    },
  );
}
